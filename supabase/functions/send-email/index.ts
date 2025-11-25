// Email Sending Function for Asenay-Book
// Uses Resend API for transactional emails

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface EmailRequest {
  to: string | string[];
  subject: string;
  html?: string;
  text?: string;
  template?: string;
  data?: Record<string, unknown>;
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const resendApiKey = Deno.env.get("RESEND_API_KEY");
    
    if (!resendApiKey) {
      throw new Error("RESEND_API_KEY not configured");
    }

    const emailRequest: EmailRequest = await req.json();
    
    // Validate required fields
    if (!emailRequest.to || !emailRequest.subject) {
      throw new Error("Missing required fields: to, subject");
    }

    if (!emailRequest.html && !emailRequest.text) {
      throw new Error("Either html or text content is required");
    }

    // Send email via Resend API
    const response = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${resendApiKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from: "Asenay-Book <noreply@asenaybook.com>",
        to: emailRequest.to,
        subject: emailRequest.subject,
        html: emailRequest.html,
        text: emailRequest.text,
      }),
    });

    const result = await response.json();

    if (!response.ok) {
      throw new Error(result.message || "Failed to send email");
    }

    return new Response(
      JSON.stringify({ success: true, id: result.id }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200 
      }
    );
    
  } catch (error) {
    console.error("Email error:", error.message);
    return new Response(
      JSON.stringify({ error: error.message }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 400 
      }
    );
  }
});
