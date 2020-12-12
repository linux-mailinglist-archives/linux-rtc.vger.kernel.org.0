Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6F32D8446
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Dec 2020 05:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388168AbgLLEKt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 23:10:49 -0500
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:42122 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbgLLEK0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Dec 2020 23:10:26 -0500
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 3F18020CCD
        for <linux-rtc@vger.kernel.org>; Sat, 12 Dec 2020 04:09:45 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 46EA52008F;
        Sat, 12 Dec 2020 04:08:50 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id A6A793EDEC;
        Sat, 12 Dec 2020 05:07:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id CE8622A379;
        Fri, 11 Dec 2020 23:07:11 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607746031;
        bh=gDO5k6b18EjcbaZ2hywXumGArL1RdQqigFycWfjiF58=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AbbbDWNn6hc+2MCzliGgTRmWF4tr1FOr28crGs7rsC8z6jYJAPcQxD7nxFYRJKaHx
         p8eM57eFgDzoRT4SsxHiWn+ZLxBon1mPK43ok2JGXtpyttkNw96iNh7jZqiiyJI8ci
         RAWBs1fCoJlAV2L0+YPrw3Bn/mKzENcntIDcVMp8=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6Z5x-mb0Xop7; Fri, 11 Dec 2020 23:07:10 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 11 Dec 2020 23:07:10 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E03E242F57;
        Sat, 12 Dec 2020 04:07:09 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="gBZ8Fsve";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.161.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2FE1F42F46;
        Sat, 12 Dec 2020 04:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607746019; bh=gDO5k6b18EjcbaZ2hywXumGArL1RdQqigFycWfjiF58=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gBZ8FsveqqsxVLM11AParQhAvpse0YB9weUknRlUs9jOv+WynSIySSvb+DjekNxkZ
         qBtOj4UjSJFL0R8LGfqmX3JKOXSI7c1PMLPw/vx/FBZsoYgqc2vIUEkQtdkAaNPDpv
         0GYP3IXO5i7iBjNjMxfauALnMEN+/tzW0b635dr0=
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [RFC PATCH 06/12] dt-bindings: rtc: sun6i: add compatible string for V831/V833 RTC
Date:   Sat, 12 Dec 2020 12:06:35 +0800
Message-Id: <20201212040641.3640916-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201212040157.3639864-1-icenowy@aosc.io>
References: <20201212040157.3639864-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [6.40 / 20.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[59.41.161.2:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         DMARC_NA(0.00)[aosc.io];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_SEVEN(0.00)[11];
         MID_CONTAINS_FROM(1.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: E03E242F57
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

V831/V833 SoCs (the same die) have a RTC block similar to the one in H6,
but allow to generate the osc32k clock from osc24M.

Add a new compatible string for that.

The functionality of dividing osc24M to generate osc32k is still TODO.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 37c2a601c3fa..6e3a3b14db7b 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -21,6 +21,7 @@ properties:
       - const: allwinner,sun8i-h3-rtc
       - const: allwinner,sun8i-r40-rtc
       - const: allwinner,sun8i-v3-rtc
+      - const: allwinner,sun8i-v831-rtc
       - const: allwinner,sun50i-h5-rtc
       - items:
           - const: allwinner,sun50i-a64-rtc
@@ -97,6 +98,7 @@ allOf:
       properties:
         compatible:
           contains:
+            const: allwinner,sun8i-v831-rtc
             const: allwinner,sun50i-h6-rtc
 
     then:
-- 
2.28.0
