Return-Path: <linux-rtc+bounces-3441-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB6A58B96
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 06:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664A23AB392
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 05:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351201B87D1;
	Mon, 10 Mar 2025 05:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRJe2w5/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37982F28;
	Mon, 10 Mar 2025 05:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741583786; cv=none; b=ZbkMm+zReT7RgMnmt5VA7EVo4t4GiTA9cCPP8QZOiYpkmulqo4Hj8nmQu+dUAYVVBoKsIpEc2FgaFdWSZ+OiFAMNwzbAq+nXeUHhGfQkbxwjo2ZfjNPoVUucWvx2x+r2iwK6d+ex0CpAyANuaBCNzRDNMUZiwUfN2pWTBwoymNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741583786; c=relaxed/simple;
	bh=AMhI7JRcMqjYWK719rUTDjCl39e1BBUhYoi4R6FJmos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dR3MM/21y/sj6tsProdOEIEO9oQGxj3x9z2iFdiWdi/wDluwRvinsoOeQjU26Zl5RuNZnxUmox46d3ntyRQsqbCVPiXrsy8bgbJYczb1Q9C/Br7pC8E8x7cxN/1HGZ0hfrRy5nMrAoZDWCxSQfyT7ayYTrJ4FaeBhJlirQelMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRJe2w5/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A227C4CEE5;
	Mon, 10 Mar 2025 05:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741583785;
	bh=AMhI7JRcMqjYWK719rUTDjCl39e1BBUhYoi4R6FJmos=;
	h=Date:From:To:Cc:Subject:From;
	b=CRJe2w5/5Z/oIMxOkoZFBRvGujAkiKLCH6vOzH4SY2F1ktwmiWucg2VIZKD+3qF3t
	 YB3cWptJGvHBU7RcYqX+J858AHK+Xx3EJZWyzl+OrVSj6Z/8mGIAr6WpQ16KQPXnr/
	 vFNGT8bfv83CiGulOnAn2xwDSdQ9RZxqLnYkqH6FT+DzoNPfBLT+IujJ3/bVGiVj/K
	 lBJKWR1kT1VmkTwZviCRQmLzm4+0XIFEsOJCss8EbVilz43FPmZJT3g0cdaFQeQRPQ
	 ee2s/5Jqx5BKHVIje+a4N1ECqiWzJJqHxKys9yGuvflLUeGUKH0/h6ozTqXYhx/crs
	 ahZg/Eo6rVnLg==
Date: Mon, 10 Mar 2025 15:46:26 +1030
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [RFC] rtc: Avoid a couple of -Wflex-array-member-not-at-end warnings
Message-ID: <Z851qvkycepdNlBd@kspp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

As part of the efforts to globally enable -Wflex-array-member-not-at-end,
I'm currently trying to fix the following warnings:

drivers/rtc/rtc-cros-ec.c:62:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/rtc/rtc-cros-ec.c:40:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

The issue is that `struct cros_ec_command` is a flexible structure (which
means that it contains a flexible-array member), and there is an object
of this type (msg) declared within another structure but at the end.

It seems that the following patch would suffice, as long as the flex-array
member in `struct cros_ec_command` is not expected to be accessed and
overlap with `struct ec_response_rtc data` in a "controlled manner":

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 865c2e82c7a5..7e9bbab47e4c 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -37,8 +37,8 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
 {
        int ret;
        struct {
-               struct cros_ec_command msg;
                struct ec_response_rtc data;
+               struct cros_ec_command msg;
        } __packed msg;
 
        memset(&msg, 0, sizeof(msg));
@@ -59,8 +59,8 @@ static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
 {
        int ret;
        struct {
-               struct cros_ec_command msg;
                struct ec_response_rtc data;
+               struct cros_ec_command msg;
        } __packed msg;
 
        memset(&msg, 0, sizeof(msg));

Otherwise, we probably need to use struct_group_tagged() as follows:

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 865c2e82c7a5..6dc815bdbcd9 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -37,7 +37,7 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
 {
        int ret;
        struct {
-               struct cros_ec_command msg;
+               struct cros_ec_command_hdr msg;
                struct ec_response_rtc data;
        } __packed msg;
 
@@ -45,7 +45,10 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
        msg.msg.command = command;
        msg.msg.insize = sizeof(msg.data);
 
-       ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+       ret = cros_ec_cmd_xfer_status(cros_ec,
+                                     container_of(&msg.msg,
+                                                  struct cros_ec_command,
+                                                  __hdr));
        if (ret < 0)
                return ret;
 
@@ -59,7 +62,7 @@ static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
 {
        int ret;
        struct {
-               struct cros_ec_command msg;
+               struct cros_ec_command_hdr msg;
                struct ec_response_rtc data;
        } __packed msg;
 
@@ -68,7 +71,10 @@ static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
        msg.msg.outsize = sizeof(msg.data);
        msg.data.time = param;
 
-       ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+       ret = cros_ec_cmd_xfer_status(cros_ec,
+                                     container_of(&msg.msg,
+                                                  struct cros_ec_command,
+                                                  __hdr));
        if (ret < 0)
                return ret;
        return 0;
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 3ec24f445c29..2a638c8c5ec2 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -80,11 +80,13 @@ enum {
  * @data: Where to put the incoming data from EC and outgoing data to EC.
  */
 struct cros_ec_command {
-       uint32_t version;
-       uint32_t command;
-       uint32_t outsize;
-       uint32_t insize;
-       uint32_t result;
+       struct_group_tagged(cros_ec_command_hdr, __hdr,
+               uint32_t version;
+               uint32_t command;
+               uint32_t outsize;
+               uint32_t insize;
+               uint32_t result;
+       );
        uint8_t data[];
 };

What do you think?

Thanks!
--
Gustavo

