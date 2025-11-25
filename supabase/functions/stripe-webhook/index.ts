// Stripe Webhook Handler for Asenay-Book
// Handles payment events from Stripe

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type, stripe-signature",
};

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const signature = req.headers.get("stripe-signature");
    const body = await req.text();
    
    // Get Stripe secret from environment
    const stripeWebhookSecret = Deno.env.get("STRIPE_WEBHOOK_SECRET");
    const stripeSecretKey = Deno.env.get("STRIPE_SECRET_KEY");
    
    if (!stripeWebhookSecret || !stripeSecretKey) {
      throw new Error("Stripe secrets not configured");
    }

    // TODO: Verify webhook signature with Stripe
    // const stripe = new Stripe(stripeSecretKey);
    // const event = stripe.webhooks.constructEvent(body, signature, stripeWebhookSecret);

    const event = JSON.parse(body);

    // Initialize Supabase client
    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Handle different event types
    switch (event.type) {
      case "checkout.session.completed":
        // Handle successful checkout
        console.log("Checkout completed:", event.data.object.id);
        break;
        
      case "customer.subscription.created":
        // Handle new subscription
        console.log("Subscription created:", event.data.object.id);
        break;
        
      case "customer.subscription.updated":
        // Handle subscription update
        console.log("Subscription updated:", event.data.object.id);
        break;
        
      case "customer.subscription.deleted":
        // Handle subscription cancellation
        console.log("Subscription cancelled:", event.data.object.id);
        break;
        
      case "invoice.paid":
        // Handle successful payment
        console.log("Invoice paid:", event.data.object.id);
        break;
        
      case "invoice.payment_failed":
        // Handle failed payment
        console.log("Payment failed:", event.data.object.id);
        break;
        
      default:
        console.log("Unhandled event type:", event.type);
    }

    return new Response(
      JSON.stringify({ received: true }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200 
      }
    );
    
  } catch (error) {
    console.error("Webhook error:", error.message);
    return new Response(
      JSON.stringify({ error: error.message }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 400 
      }
    );
  }
});
