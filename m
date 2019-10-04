Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A518ACC32C
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Oct 2019 20:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfJDS63 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Oct 2019 14:58:29 -0400
Received: from mx2.ucr.edu ([138.23.62.3]:17212 "EHLO mx2.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfJDS62 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 4 Oct 2019 14:58:28 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Oct 2019 14:58:28 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570215508; x=1601751508;
  h=from:to:cc:subject:date:message-id;
  bh=zeBRvpLS7yocFhDOcjTM7Sf+v5207KV1o2FMvWYXbvw=;
  b=rPANICb1BsBZIxgLz13e/y8LwZGrc0CY4jSlmfkIPJOc5CroA9Y7S6sS
   //e0UTpPCqsEqhI1iXd2GOKzUI7zrfGPw57NHK2YDCbZkNbaph+Zn2kv5
   IPaauKKVFpuvGSeRtBMZa+82GV7LCentMNHK9oLpGQ/tbjekOpKaULjh2
   Iek4Vw1PW1sCV4iUbEhk8pjnBnWnhVy7iZWSds4IhoUnAFfZZB827/a0K
   puI4sSvfMLNRetWOFtGXclQJwEFsBavMrWppUWYd22OvgSllsmxSek4ED
   0JQae0YdXowyPDcrgJ6X0JFHwy14A9tW4NB6truQSzSnSfLBXjanjXnQG
   w==;
IronPort-SDR: sNTcZn4HBiVZVIIR/VsgDwojeeZcF8+4tU3DvMCetbdNp5aeMuIGmOGdYDwMxD0rRe7fFG+Ayk
 o+OOHuzcgXdRCLwh8wHEYYMbVWsLLXhAPSGAuuZwQ9gMdlU3XEPNdgAKS14zKCwq43YvlgR/JB
 8rbFpnYO6VIRIqWJK0GhInF7ovf5Nobe5d0uxdb7FSxUTkCHuBHD7Cqh5Ti36QG+OqoCXgqyhQ
 DxMqAvfYe+5OfDIle/tyNEMR/gUDtSScXVBK8SO4PAJVrL+4e6MEEReqI7ebTmHxAogG3nKASy
 Nx0=
IronPort-PHdr: =?us-ascii?q?9a23=3AqbCXjhLHbbKhLSvh/tmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgeK/rxwZ3uMQTl6Ol3ixeRBMOHsqkC1rOd6vq6EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oLBi6sArdutQIjYd8N6081g?=
 =?us-ascii?q?bHrnxUdupM2GhmP0iTnxHy5sex+J5s7SFdsO8/+sBDTKv3Yb02QaRXAzo6PW?=
 =?us-ascii?q?814tbrtQTYQguU+nQcSGQWnQFWDAXD8Rr3Q43+sir+tup6xSmaIcj7Rq06VD?=
 =?us-ascii?q?i+86tmTgLjhTwZPDAl7m7Yls1wjLpaoB2/oRx/35XUa5yROPZnY6/RYc8WSW?=
 =?us-ascii?q?9HU8ZUVixBGZi8b4oJD+oOIO1WsZDzrEYArRu/GwasAP7gwSJMinL4waE21u?=
 =?us-ascii?q?IsHgba0QEuA94CrW3YoMnoOKwPVey50anFwTDFYvhL2zny9ZLIfwghr/+SQL?=
 =?us-ascii?q?x+f8nfx040Gg/Zklmds5DpMimJ2ugRtWWQ8upuVfioi24iswx+oDmvx8Ysio?=
 =?us-ascii?q?nUgYIe11fJ9CV4wYY1P9K4SVJ3bcKqHZZLqiGVK5F2Ttk8TG51pSY307sLso?=
 =?us-ascii?q?O4cigS0Jkr2QLTZvidf4WL4h/vTvidLSp3iX5/Zb6ygxS//VC9xuD9UsS4yk?=
 =?us-ascii?q?hGoyRFn9XWqHwA1gbf58qIR/Z740yvwyyA1xrJ5eFBOU00kK3bJIM/zbMojZ?=
 =?us-ascii?q?oTtFjDHjfxmEXrkK+abkUk9fas6+Tgerjmo4WTN45wig3nKqQuntGzDf02Mg?=
 =?us-ascii?q?QTW2WW+/6w1LLk/U3+T7VKiuM5nrPFv5DdIMQXvq+5AwlL3YY/8xuzESuq3d?=
 =?us-ascii?q?ACkXQELF9JYgyLg5XmNl3UPfz1CfWyj0ypkDhxxvDGOrPhAo/KLnjGiLrgfb?=
 =?us-ascii?q?d8605Gxwoy0dxT+5xZB6ocIP3vQE/9rsLXAQIkMwCs2eboFM191p8CWWKIGq?=
 =?us-ascii?q?KZNKLSsVmV5uMgOuWMfpMVtyrmJvg76P7hk2U5lUUefaa3x5sXbm63HvB8L0?=
 =?us-ascii?q?Wee3rsjYRJP30Nu18PTf7qlVrKBS9BZ3+zB/pnziwwEsSrAZqVFdPlu6CIwC?=
 =?us-ascii?q?ruRs4eXWtBEF3ZVCq1eg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FiAwCrk5ddgMXWVdFmgh6DXkwQjSS?=
 =?us-ascii?q?GLgMGiycYcYV6iDOBewEIAQEBDAEBLQIBAYRAgkojNQgOAgMJAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQkNCQgnhUKCOimDNQsWFVKBFQEFATUiOYJHAYF2FKMDgQM8jCU?=
 =?us-ascii?q?ziGYBCQ2BSAkBCIEihzWEWYEQgQeDbnOEDYNYgkQEgTcBAQGVK5ZSAQYCghE?=
 =?us-ascii?q?UgXiTFCeEPIk/i0QBLacvAgoHBg8jgTEDgg1NJYFsCoFEUBAUkDUhM4EIjhO?=
 =?us-ascii?q?CVAE?=
X-IPAS-Result: =?us-ascii?q?A2FiAwCrk5ddgMXWVdFmgh6DXkwQjSSGLgMGiycYcYV6i?=
 =?us-ascii?q?DOBewEIAQEBDAEBLQIBAYRAgkojNQgOAgMJAQEFAQEBAQEFBAEBAhABAQkNC?=
 =?us-ascii?q?QgnhUKCOimDNQsWFVKBFQEFATUiOYJHAYF2FKMDgQM8jCUziGYBCQ2BSAkBC?=
 =?us-ascii?q?IEihzWEWYEQgQeDbnOEDYNYgkQEgTcBAQGVK5ZSAQYCghEUgXiTFCeEPIk/i?=
 =?us-ascii?q?0QBLacvAgoHBg8jgTEDgg1NJYFsCoFEUBAUkDUhM4EIjhOCVAE?=
X-IronPort-AV: E=Sophos;i="5.67,257,1566889200"; 
   d="scan'208";a="12868078"
Received: from mail-pl1-f197.google.com ([209.85.214.197])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Oct 2019 11:51:21 -0700
Received: by mail-pl1-f197.google.com with SMTP id 70so4483039ple.1
        for <linux-rtc@vger.kernel.org>; Fri, 04 Oct 2019 11:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Nx7Raw+8VvaKmHv7iUq+/mNfi5w+U2K2Q09elPzOslc=;
        b=L1cLZl0+tLrGEpnqJbJN3D+ZFmDuiIJRSyf/7kd9wPF74dhX74Hw1ZYqZAPz9WYzcG
         v0RE/Wx6CSoJBMzMEYoPOEy8wusTEdUJejIwBSpB52MgbpKT1w7XKA/sXAcDYEq5yjxu
         p1QYLYaeZd15MTMHloxLEAOCZfqourcuW/viG9jwKP4KZAx+5Vcc6X63/rzeB8y5u2qu
         8AIPA5yP2QG2iZUl5FTzZBvf276lgZ9RN00C+3Lc8zetzHs/9aK7pR/OCYjz2m9N/8f5
         21gXhnJo/tDNdggt9R/raEZXYv2h30LW+sblcqwBJ4EugFTUDNiZfvm7WWfnQ9ghvS6P
         CnmQ==
X-Gm-Message-State: APjAAAW/EWaHGQI5qcwJrLQfJkvZ9NrU9cnR5ZEHyQZYSlMvJnR6gxN/
        dBMgmA4wFLROJv+3fsQ8VPy8QUnrTtc2NxTRsmAOS63jLRUOM5Mrl8gPhBZMgsHxYw2CLJ33qts
        HjVxmxqYUCzYeRqQjSSuEXg==
X-Received: by 2002:a17:902:6b02:: with SMTP id o2mr16691792plk.302.1570215080757;
        Fri, 04 Oct 2019 11:51:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5QtwmXyYfQo5M6IJC7lIS0EJ1qWyQ73hBNC1cEHpkJbeVfKj1RyhZkECc6mcP1X5ruAFGHg==
X-Received: by 2002:a17:902:6b02:: with SMTP id o2mr16691773plk.302.1570215080459;
        Fri, 04 Oct 2019 11:51:20 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id e192sm8101014pfh.83.2019.10.04.11.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 11:51:19 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: snvs: fix uninitialized usage of "lpcr" in snvs_rtc_enable()
Date:   Fri,  4 Oct 2019 11:52:06 -0700
Message-Id: <20191004185206.7466-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Inside function snvs_rtc_enable(), variable "lpcr" could be
uninitialized if regmap_read() returns -EINVAL. However,"lpcr"
is used later in the if statement, which is potentially unsafe.

Similar cases happened in function snvs_rtc_irq_handler() with
variable "lpsr" and function snvs_rtc_read_alarm() with variables
"lptar", "lpsr". The patch for those two are not easy since
-EINVAL is not an acceptable return value for these functions.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/rtc/rtc-snvs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index 757f4daa7181..dadcc3e193b2 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -124,12 +124,16 @@ static int snvs_rtc_enable(struct snvs_rtc_data *data, bool enable)
 {
 	int timeout = 1000;
 	u32 lpcr;
+	int ret;
 
 	regmap_update_bits(data->regmap, data->offset + SNVS_LPCR, SNVS_LPCR_SRTC_ENV,
 			   enable ? SNVS_LPCR_SRTC_ENV : 0);
 
 	while (--timeout) {
-		regmap_read(data->regmap, data->offset + SNVS_LPCR, &lpcr);
+		ret = regmap_read(data->regmap,
+					data->offset + SNVS_LPCR, &lpcr);
+		if (ret)
+			return ret;
 
 		if (enable) {
 			if (lpcr & SNVS_LPCR_SRTC_ENV)
-- 
2.17.1

