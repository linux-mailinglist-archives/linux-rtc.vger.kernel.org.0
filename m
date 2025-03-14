Return-Path: <linux-rtc+bounces-3488-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80615A60B9E
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 09:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BAE47AE948
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37391C8621;
	Fri, 14 Mar 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJ9mnZfc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3A1C84C0;
	Fri, 14 Mar 2025 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941054; cv=none; b=Ijs/E1E9RpEjzBI+Cks/lpZ43kWX0C+aypLamA5xdghoGqzMGiuepR4/EXMWPu07qfzedsCOKiSHCY8smCCaQCxj/L54srCtGXNrO/z1617fE/SESHRiomBYjNj3flNu4ceetuMBIU6J5TfKsnNHULl43Ww1zSjQxa5P8DRoYJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941054; c=relaxed/simple;
	bh=Rkc0SP4VHxp6hxY21Mys8rojGRFiRsk4iICpePJsRs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c39IXKk0bOmQGWmd1xfQxP4mccptpjRdC0GwTFIeZvCdg3Q4ZNnpFdZO7KvM042sHlGcugo1N71qCag9eSxYXuXBEhJJjKyVNQISBgmwFrDiznqH6dhiCIXuxmW79uBOHE1u6JqaG5xXj/3yVplg+9FTdSnU8xB2kIBVSv/XKZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJ9mnZfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEF1C4CEF1;
	Fri, 14 Mar 2025 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741941053;
	bh=Rkc0SP4VHxp6hxY21Mys8rojGRFiRsk4iICpePJsRs0=;
	h=Date:From:To:Cc:Subject:From;
	b=dJ9mnZfciy5Q6V6gTclDBr+qRgaKRvYg/ag4N7m4TzkCCVOvvGoDQPHqP6fbOxhM0
	 bMsGNnjC6NQaw3LhhF/m41XvWPo3CSjrHbu4ztVX1mE6ejNN6gsYGBof4HYj1l+60B
	 M/Sev4wrujJ3FP3xB1csvFNDZ99JI0lWifoyGs/ECNM6cfy1dlHxzU6mcR07JsEUkq
	 A19mX/V0lqxHKk1vFXmF43stYWUHkJmI1tnh1EgT2nzGan0D9IfXnobEvYXkI5H9SO
	 0bNjePwHMBpMEpUiqay+gCRWMCuXmED/79Gq3QxJrlaDSCqMG3IuzbZA8M8HFCOqmg
	 w7L94Wl5jno9g==
Date: Fri, 14 Mar 2025 19:00:54 +1030
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] rtc: Avoid a couple of
 -Wflex-array-member-not-at-end warnings
Message-ID: <Z9PpPg06OK8ghNvm@kspp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/rtc/rtc-cros-ec.c:62:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/rtc/rtc-cros-ec.c:40:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Change in v2:
 - Cast to `struct ec_response_rtc *`, instead of using memcpy(). (Tzung-Bi Shih)

v1:
 - Link: https://lore.kernel.org/linux-hardening/Z9N8BsVJF-s6Hcvd@kspp/

 drivers/rtc/rtc-cros-ec.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 865c2e82c7a5..e956505a06fb 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -35,21 +35,18 @@ struct cros_ec_rtc {
 static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
 			   u32 *response)
 {
+	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
+			sizeof(struct ec_response_rtc));
 	int ret;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_response_rtc data;
-	} __packed msg;
 
-	memset(&msg, 0, sizeof(msg));
-	msg.msg.command = command;
-	msg.msg.insize = sizeof(msg.data);
+	msg->command = command;
+	msg->insize = sizeof(struct ec_response_rtc);
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
 	if (ret < 0)
 		return ret;
 
-	*response = msg.data.time;
+	*response = ((struct ec_response_rtc *)msg->data)->time;
 
 	return 0;
 }
@@ -57,18 +54,15 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
 static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
 			   u32 param)
 {
+	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
+			sizeof(struct ec_response_rtc));
 	int ret;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_response_rtc data;
-	} __packed msg;
 
-	memset(&msg, 0, sizeof(msg));
-	msg.msg.command = command;
-	msg.msg.outsize = sizeof(msg.data);
-	msg.data.time = param;
+	msg->command = command;
+	msg->outsize = sizeof(struct ec_response_rtc);
+	((struct ec_response_rtc *)msg->data)->time = param;
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
 	if (ret < 0)
 		return ret;
 	return 0;
-- 
2.43.0


