Return-Path: <linux-rtc+bounces-3484-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1AA606A6
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 01:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBE2B3BC07B
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 00:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DBE7485;
	Fri, 14 Mar 2025 00:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+qbwaQq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA3D2E338F;
	Fri, 14 Mar 2025 00:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741913093; cv=none; b=obhv36np7tO2UYi7NK4xyEQ3lpFT/oF65PQAqAw8RwlCuuwaK14b4c1O0MUKx3PGwDqZ7QPJacKWo/qo5DEdY3XG+jXAaRhKZFTZWI5gQRifLp4sMWGdbGrytHxMet4vUuF4eTY3krysT4PZi2DnhxC08VMpljTLPjIT/DFhURM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741913093; c=relaxed/simple;
	bh=FtA3xN893ieXKHXYxZAGuWY0s9YlJjx1BtNWNk5YfsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjLffHVKQvL8BquZWGlkHc6eTGH9iasK7sXJxshyFxdQKx7n0z2NCTP+QZYW+hbn007mnn4+nziQebANPmuOlM5tBIQaYgar7l8x6nHLSm/4FyfOW1F2PIKy0ZzPqSLhubL99GjtotxrCO4FzjEsVQw2bsvMuSywSIKaAYAkjkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+qbwaQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1696C4CEDD;
	Fri, 14 Mar 2025 00:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741913092;
	bh=FtA3xN893ieXKHXYxZAGuWY0s9YlJjx1BtNWNk5YfsY=;
	h=Date:From:To:Cc:Subject:From;
	b=n+qbwaQqeQtwbxsLxOiwy2kNv1QpNDshl3sDtqpszdil6QqdcCL8IgH/jzR3LayGm
	 KMTxpuyFV8BZJ8swFnSRreZiIWkVCkJAAwb9pQ23aZmBEL3OlRBKsiIi0UhJ4Fjha2
	 LXjbPcdGb5kR5zWM3ofQHnTo5aX1P7ne00rdl95Lc0wGdoNg3Zskuw4r0GtUHhJJ+S
	 Tvvm8n2VkP32CJlC9VHPxd7FaBj5m1rHIbwTcdW2Hn9DmW/84ENL/pWg0wIbZtxQTn
	 xL+ohOm/BCD3z268mo6Juil2sl5wfsHez+ClVmSkOULf9aglPPIUD1qT/gLSmg0DVu
	 99Iy/LIwzVbfQ==
Date: Fri, 14 Mar 2025 11:14:54 +1030
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] rtc: Avoid a couple of -Wflex-array-member-not-at-end
 warnings
Message-ID: <Z9N8BsVJF-s6Hcvd@kspp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warnings:

drivers/rtc/rtc-cros-ec.c:62:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/rtc/rtc-cros-ec.c:40:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/rtc/rtc-cros-ec.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 865c2e82c7a5..9144bc12e0b7 100644
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
+	memcpy(response, msg->data, sizeof(*response));
 
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
+	memcpy(msg->data, &param, sizeof(param));
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
 	if (ret < 0)
 		return ret;
 	return 0;
-- 
2.43.0


