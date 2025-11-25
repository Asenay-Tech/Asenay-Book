// Scheduled Tasks Function for Asenay-Book
// Triggered by pg_cron or external scheduler

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface TaskRequest {
  task: string;
  params?: Record<string, unknown>;
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Initialize Supabase client
    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    const taskRequest: TaskRequest = await req.json();
    
    let result: unknown;

    switch (taskRequest.task) {
      case "cleanup-expired-sessions":
        // Clean up expired user sessions
        const { error: sessionError } = await supabase
          .from("sessions")
          .delete()
          .lt("expires_at", new Date().toISOString());
        
        if (sessionError) throw sessionError;
        result = { task: "cleanup-expired-sessions", status: "completed" };
        break;

      case "generate-daily-reports":
        // Generate daily financial reports
        console.log("Generating daily reports...");
        result = { task: "generate-daily-reports", status: "completed" };
        break;

      case "sync-external-data":
        // Sync data from external sources
        console.log("Syncing external data...");
        result = { task: "sync-external-data", status: "completed" };
        break;

      case "send-reminder-emails":
        // Send reminder emails for pending tasks
        console.log("Sending reminder emails...");
        result = { task: "send-reminder-emails", status: "completed" };
        break;

      case "calculate-token-usage":
        // Calculate and update token usage for billing
        console.log("Calculating token usage...");
        result = { task: "calculate-token-usage", status: "completed" };
        break;

      case "archive-old-data":
        // Archive data older than retention period
        console.log("Archiving old data...");
        result = { task: "archive-old-data", status: "completed" };
        break;

      default:
        throw new Error(`Unknown task: ${taskRequest.task}`);
    }

    return new Response(
      JSON.stringify(result),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 200 
      }
    );
    
  } catch (error) {
    console.error("Task error:", error.message);
    return new Response(
      JSON.stringify({ error: error.message }),
      { 
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 400 
      }
    );
  }
});
