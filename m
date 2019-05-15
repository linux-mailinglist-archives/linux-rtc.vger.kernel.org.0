Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FE01F66D
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2019 16:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfEOOUk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 May 2019 10:20:40 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37049 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfEOOUk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 May 2019 10:20:40 -0400
Received: by mail-lj1-f194.google.com with SMTP id h19so2701812ljj.4
        for <linux-rtc@vger.kernel.org>; Wed, 15 May 2019 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=YMwQpxiUwj2cT4FqUrUHXV80PQdmZFxXDMY3ylf0go4=;
        b=iPhqIpdqqX9dUqy4uUKArSPUkyXqjPd1GOQr/5AaYIOa4vMVTRPhiV4Jm1OEc5JW9K
         FmUr9U2FuzrTf4oXQbcSlXq+gvWbserHTyxMjTdR6G5y597mnGg9mkczEw12ekmtbnm7
         MG0QsErF1v8fNuPIEpD5Nl/NyFz7m3kHa1M9aLlsFmq6+rBlfy9+HiqVFi0/I6RcPxMC
         7N85aASBxWA79/QdZZQZ4W5CfBxOyyDliMPgJMo+kGEeFLBosxpVoX8uyJ21m6zA5oKf
         f1cW6vVQRPSzwfTgFQiDi/M735jTbDrJ70TjUBWtRES5+9jmG7N1ntJor8aji8txkna9
         zXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YMwQpxiUwj2cT4FqUrUHXV80PQdmZFxXDMY3ylf0go4=;
        b=ItjxekLIxAkhsR4PbclvIbU/TkuzQROrCw+D3CbGiANLxhB3dDyfvfi0GUvpTJjETo
         fXXdAVmXWn9uWuySlu8QrP9Kq2HL8t9Ry9ra58msBNQc3bfh8/xiws6v1LQaUvhILIKY
         9JLEumn/XaBFgTxercfXpA6GJgXEtaDxh+TV+o1P+Lun3xII0xA8GqVzPszhK/saq9La
         wGUV7ZBWwuXRjotkKruILoR47F1LVeicb7t7fUM1OCh2pVhYjELKZsQaquGwVXjO+rVx
         KArJ4R4VCrsQifsus6Ek+nNVHTs0ywvSL9uyEinTUmtmT12KsO+/nPWI6dy0ZR0I9/wC
         c8jA==
X-Gm-Message-State: APjAAAV1+Cp6QWkPfUn9ELZLp8rwlfYuq8JIUGlVKs9u3JCW1xS+7V5Y
        mNcGKbPvxeo5FHziY93jz0pkpw==
X-Google-Smtp-Source: APXvYqxLD/Xz/XOt80cJ7YXHPOP+mYypFxg9knaqEMHMXEygAeuW2r8l1jyoq+xHXe44xruKXkwNkA==
X-Received: by 2002:a2e:9142:: with SMTP id q2mr1086173ljg.18.1557930038264;
        Wed, 15 May 2019 07:20:38 -0700 (PDT)
Received: from roman-VirtualBox.synapse.com ([195.238.92.107])
        by smtp.gmail.com with ESMTPSA id h11sm414592lfh.8.2019.05.15.07.20.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 07:20:37 -0700 (PDT)
From:   roman.stratiienko@globallogic.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Roman Stratiienko <roman.stratiienko@globallogic.com>
Subject: [PATCH v2] rtc: test: enable wakeup flags
Date:   Wed, 15 May 2019 17:20:22 +0300
Message-Id: <20190515142022.15019-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Alarmtimer interface uses only the RTC with wekeup flags enabled.
Allow to use rtc-test driver with alarmtimer interface.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>

---
Changes in v2:

Wakeup flags applied only for the RTCs with alarm support

 drivers/rtc/rtc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
index 6c5f09c815e8..473bbb30bc1c 100644
--- a/drivers/rtc/rtc-test.c
+++ b/drivers/rtc/rtc-test.c
@@ -133,6 +133,7 @@ static int test_probe(struct platform_device *plat_dev)
 		break;
 	default:
 		rtd->rtc->ops = &test_rtc_ops;
+		device_init_wakeup(&plat_dev->dev, 1);
 	}
 
 	timer_setup(&rtd->alarm, test_rtc_alarm_handler, 0);
-- 
2.17.1

