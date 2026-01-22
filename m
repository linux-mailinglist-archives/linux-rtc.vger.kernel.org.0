Return-Path: <linux-rtc+bounces-5835-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BLAD9cfcmmPdQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5835-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 14:02:15 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D31AB66FA6
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 14:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CC17949D52
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DF42D8DD0;
	Thu, 22 Jan 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FwqSVmsJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ol+NvhPk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CA28FFFB
	for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086060; cv=none; b=gFfrtGa/DtFyRuqlpCWRO7f3wOWTSuBkdqBWZvs5v6L5iIDaWhpxP3NSqpw09DkkGWnQ9Ob0CIIj1yNvq+gdyXi3bp55L3cqthjs0hfc6uGbEiv7Q/bt2RASJWaw+XS2mC7HPsdsDN/MrNXPeQJvTNQJ9VZzusmWhoHlR2BFRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086060; c=relaxed/simple;
	bh=f02GzYx48kesQ7jeGELEbs6RFs9qvuIFf9axfxA+iKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mwo5sfU7bsTnAaZ++E1u6Am/sAKECEA6dA364EEWSr7uP2weMj9sQgJtw62Rk1hC0/kLbRFhDWijqbpMjMYasfgZax7krHeIrqtoVNtfDWtRO4OrdrqfO6PemJ5tmMuQdlzlPtPzaJYd1EVGT1eiSYJ3F8PSaHKp6S1/ef71BD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FwqSVmsJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ol+NvhPk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769086055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/p/2bC3+sbtEKV34RBkBnld1uYguVdDfDr4y5ubycHk=;
	b=FwqSVmsJz5qEt0wLRXVVy33ytCMHbYjOk3hUIza0Dy2Us0Opp4CYEwtUNqwpNxRTIPkHA7
	3cfeKhoCHFIm+x1P++iN/RdiX137xfzQ18piKz92R4smznlWnLeb97BE8SR7s2PUys8Qn/
	5ps4xfelQnmdBD4acx4WeMk0G+WmQK4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-NlxqMsAtMcucwdHrCCA9uw-1; Thu, 22 Jan 2026 07:47:34 -0500
X-MC-Unique: NlxqMsAtMcucwdHrCCA9uw-1
X-Mimecast-MFC-AGG-ID: NlxqMsAtMcucwdHrCCA9uw_1769086054
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2cc5b548so52893286d6.0
        for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769086054; x=1769690854; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/p/2bC3+sbtEKV34RBkBnld1uYguVdDfDr4y5ubycHk=;
        b=Ol+NvhPkfAd5VxOl64kAJQopVvS6EBt++SPh73gQ7JlfoWSE30WCtAbETwJHFGdDOR
         7iL/znHaSeInLtjt27IOtgGWLehDg3w8NTOi1xR+aLJz6UVlZPLZVtVc+VuYUw1/yucY
         KkG1uLhNk753Gkct/1j4N4PLF0z+5Wl5Z0DuXMQGVyfXTyTz2wD0BeGoc1kT71WL0GRm
         trM78VtcvInxDrC3dAH45bC9wDwngYLeaxAMtzFI5oy2MR6reUWk8RaqAXBjk9JyoSVr
         2T7I1ktF8CDk1xdB+ke+D0xVUxQxiWg/LLfF2LMUz2TpRxYCTodXN4dS/LHS9NRtBnTy
         /VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769086054; x=1769690854;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p/2bC3+sbtEKV34RBkBnld1uYguVdDfDr4y5ubycHk=;
        b=PsrmB46mk3lWNAd3qSXaV/dseU95vS7bprKcD4tzq9mHzsg9jFhYqT6N1mR2K6e8YA
         1TF/zb8FM2FsOjgKAtgh6jcLBBw+NHS0OV55ogM9FH3GFQVmePWPDZzh58adfbaNri5M
         dKgC8cOHfs0eCC5RYr5pWYIouLj6TmaweMpowume2L6RhwIv7SlRtXLBWCR0ZpKCovZt
         JVYX8tTaIPcZI9XEAINyd0YDtV0SQdZHTbawrh13DXLZTfv+sjbWpZK5nDBhYpXcW8Yh
         058gPJqPH/23GnBsQDSay709osaXpeA0AEQ/npRqZaVwD6prNZuibbigbold7P6pPCRi
         YDJg==
X-Forwarded-Encrypted: i=1; AJvYcCWQjOdr+TS0lqeu+tu5HOh6nof9XNakjl4y0uVJFqsGM6Kt4mwq3iBsm3Q4k4bAuStFScSpSuiR97M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0O9UOiwy9zSdLhrcKhiy/+uSbmUmtqwga8gKIG7uJounbq4QQ
	rv54bPUrTtJ0QAaDt3XKWFGuhjuIV1MwK0yC6OqcCj+Awu+IMSe4jlcKyddHpFaogNPaDT1wBgi
	2XUdeECHMXQPS66bXkBlyaaYrpuCIwBv7zbSbm2uUk6HpJxoliQfX48iyQ5OSfOO2nwQsGQ==
X-Gm-Gg: AZuq6aJ79WgDj2q7Q0PmqVGjpoRBruFvTDf6DRbSC1NX7evdseiFUGhHjk2MMagH6R1
	RLNGaV0oRbRbhw4/G9w2/pLy5Vul5rZeFArU/2wCrOtsDQcTmXnya7/4XueBWU2Idg5wK3Hwh8U
	wD7hZ5QYr6UL/WPBUgQAZ76hP9rIABLmAqGUYkrbW5U1TpgmTt2/zg+F0hJ3ypPBXU3R79xYDuZ
	RSUCJNMDl0LT1YQuQ4IVSsUxI6frfFOI8d0D1+gLwrNi0STYOug7W7y9vsmB51Bz3g6qNz9wZ4n
	eq5FQw8whR0Zk7hzJD+jPv1olbsg5g5XptMCQr5N/39j70Bkvrz4X5nGBouzGhSi+67xl29yXdg
	sFTxIh85TP7Jl8cAMIlGog83xlZdi0ZcOa6ZKETMBSaWHQr2cFQ==
X-Received: by 2002:a05:6214:2a87:b0:894:6531:d61c with SMTP id 6a1803df08f44-8947dfdc869mr37706366d6.19.1769086054143;
        Thu, 22 Jan 2026 04:47:34 -0800 (PST)
X-Received: by 2002:a05:6214:2a87:b0:894:6531:d61c with SMTP id 6a1803df08f44-8947dfdc869mr37706116d6.19.1769086053745;
        Thu, 22 Jan 2026 04:47:33 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d6ea3sm152362716d6.54.2026.01.22.04.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:47:33 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 22 Jan 2026 07:47:16 -0500
Subject: [PATCH v2] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-rtc-ac100-divider-round-rate-v2-1-044f8b493c35@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOwqAMAwA0KtIZgM1glSvIg79RM1SJVURxLtbH
 N/yHsiswhmG6gHlS7JsqYDqCsLq0sIosRjIUGcaItQjoAuNMRjlksiKup0porqD0Qfy1s+9bVs
 LpdiVZ7n/fpze9wO1QfEcbgAAAA==
X-Change-ID: 20260122-rtc-ac100-divider-round-rate-bc2b8bf98338
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4044; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=f02GzYx48kesQ7jeGELEbs6RFs9qvuIFf9axfxA+iKc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKLZFJiNTIOvcngcXj97XSFj8/WY98uuqkJWDQrrxJcN
 f/ouWNGHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzEi4nhf2CxP19gYw2LavO9
 wgX7plhbbZ24+CPTWr7NwTVc74zbljAy7J6w6O8T8zNq4tbB/M+D+iOEdwun9j6bls+3LrftU4o
 9CwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5835-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[bootlin.com:query timed out];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[bmasney.redhat.com:query timed out,alexandre.belloni.bootlin.com:query timed out];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: D31AB66FA6
X-Rspamd-Action: no action

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes since v1:
- Fix two cases of brace inbalances around if/else

Alexandre: Per v1 comments, I'll include this with my GIT PULL to Stephen.
---
 drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index 33626311fa781b5ce90dcc472f948dc933bbc897..bba7115ff3ad0f9a9b428784b49ba3fde0d18484 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -140,42 +140,16 @@ static unsigned long ac100_clkout_recalc_rate(struct clk_hw *hw,
 				   AC100_CLKOUT_DIV_WIDTH);
 }
 
-static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long prate)
-{
-	unsigned long best_rate = 0, tmp_rate, tmp_prate;
-	int i;
-
-	if (prate == AC100_RTC_32K_RATE)
-		return divider_round_rate(hw, rate, &prate, NULL,
-					  AC100_CLKOUT_DIV_WIDTH,
-					  CLK_DIVIDER_POWER_OF_TWO);
-
-	for (i = 0; ac100_clkout_prediv[i].div; i++) {
-		tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
-		tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
-					      AC100_CLKOUT_DIV_WIDTH,
-					      CLK_DIVIDER_POWER_OF_TWO);
-
-		if (tmp_rate > rate)
-			continue;
-		if (rate - tmp_rate < best_rate - tmp_rate)
-			best_rate = tmp_rate;
-	}
-
-	return best_rate;
-}
-
 static int ac100_clkout_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req)
 {
-	struct clk_hw *best_parent;
+	int i, ret, num_parents = clk_hw_get_num_parents(hw);
+	struct clk_hw *best_parent = NULL;
 	unsigned long best = 0;
-	int i, num_parents = clk_hw_get_num_parents(hw);
 
 	for (i = 0; i < num_parents; i++) {
 		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
-		unsigned long tmp, prate;
+		unsigned long prate;
 
 		/*
 		 * The clock has two parents, one is a fixed clock which is
@@ -199,13 +173,40 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
 
 		prate = clk_hw_get_rate(parent);
 
-		tmp = ac100_clkout_round_rate(hw, req->rate, prate);
-
-		if (tmp > req->rate)
-			continue;
-		if (req->rate - tmp < req->rate - best) {
-			best = tmp;
-			best_parent = parent;
+		if (prate == AC100_RTC_32K_RATE) {
+			struct clk_rate_request div_req = *req;
+
+			div_req.best_parent_rate = prate;
+
+			ret = divider_determine_rate(hw, &div_req, NULL,
+						     AC100_CLKOUT_DIV_WIDTH,
+						     CLK_DIVIDER_POWER_OF_TWO);
+			if (ret != 0 || div_req.rate > req->rate) {
+				continue;
+			} else if (req->rate - div_req.rate < req->rate - best) {
+				best = div_req.rate;
+				best_parent = parent;
+			}
+		} else {
+			int j;
+
+			for (j = 0; ac100_clkout_prediv[j].div; j++) {
+				struct clk_rate_request div_req = *req;
+				unsigned long tmp_prate;
+
+				tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[j].div);
+				div_req.best_parent_rate = tmp_prate;
+
+				ret = divider_determine_rate(hw, &div_req, NULL,
+							     AC100_CLKOUT_DIV_WIDTH,
+							     CLK_DIVIDER_POWER_OF_TWO);
+				if (ret != 0 || div_req.rate > req->rate) {
+					continue;
+				} else if (req->rate - div_req.rate < req->rate - best) {
+					best = div_req.rate;
+					best_parent = parent;
+				}
+			}
 		}
 	}
 
@@ -213,7 +214,7 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
 		return -EINVAL;
 
 	req->best_parent_hw = best_parent;
-	req->best_parent_rate = best;
+	req->best_parent_rate = clk_hw_get_rate(best_parent);
 	req->rate = best;
 
 	return 0;

---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260122-rtc-ac100-divider-round-rate-bc2b8bf98338

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


