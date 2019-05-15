Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0808D1F236
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2019 14:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729845AbfEOMAZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 May 2019 08:00:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45768 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730175AbfEOLOr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 May 2019 07:14:47 -0400
Received: by mail-lj1-f193.google.com with SMTP id r76so2094353lja.12
        for <linux-rtc@vger.kernel.org>; Wed, 15 May 2019 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JZxB086EqwggOhFxHexHkttok94oso/OJUjNF3aMwEw=;
        b=SlWMkZO0NyRYv7qICWGSh++5Zi8+7R3oKxXcZ9+KhhZYU250CR11qNBwz+rXDAuT6C
         Xqu672PFvC2GjahgiNoNuW+NQAwUkaUTgGxzrlrecppsg7v28PIxURdyOha350W1tksj
         zKE1GmGYlXMObrHbnO30DZmUh7BaDiLjkOG3X5UWf69H30F/JLN0wdHtBgUdBXZmwln8
         Uz+Mab6mr7ZAbsBtc26f6leQ04LYBFoERfXP59q4K+v/msGokMRFwTAXxd3ZpX4+5byX
         gwKrcrnZthl7A/VN02W/Vg+0tQd/xsUh5qkvLvU7bhS5U7nLl1SwcTuT9vnG2j+yvgGE
         7ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JZxB086EqwggOhFxHexHkttok94oso/OJUjNF3aMwEw=;
        b=keGRqAYXkkDTM7wykL4vB29dE8VTwf243c/HsXdWaGe5h5fkyuUsIDlhuxQhRk2v05
         I+gx9wSBA9vgKSFqwyBpM93R4uvf5fmw4ZUkR+8psfXUZOZgfAdxUmXMfkpDNuaAydBA
         mGL1WWN4cxZndTEFaCeF8/Ez98igpI2cyxPYrpvV9b830ANYO426sIqpCzcc6bb/73cz
         81C4kNAr1TozEBivwKS7a4wFDRgr6hWqgEoymOFz65EvBvDXkTHE7lP3iLUng/2GRmoF
         +9vpvFdqiJir7GeQKZluqzPZ2s9yCU0DhcS+ZndZHXtwyJrx21FKyMesUuzzQGYWpw/m
         5fzg==
X-Gm-Message-State: APjAAAU6soYR6L8BhOwdPf/6JW54VvsQydQjqSde35nzrDjBjXZ0fMgn
        e7s8mgpkc1QBOlCoa6WswJWvGA==
X-Google-Smtp-Source: APXvYqzsq1cLndnKfy+6j5tMGL0/yPrXCABoyJowsorG4ompSJaSfGcWbabzviCRJp1SQmcaFCE9Zw==
X-Received: by 2002:a2e:85c9:: with SMTP id h9mr7217175ljj.110.1557918885495;
        Wed, 15 May 2019 04:14:45 -0700 (PDT)
Received: from roman-VirtualBox.synapse.com ([195.238.92.107])
        by smtp.gmail.com with ESMTPSA id q26sm376027lfd.54.2019.05.15.04.14.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 04:14:44 -0700 (PDT)
From:   roman.stratiienko@globallogic.com
To:     a.zummo@towertech.it, alexandre.belloni@free-electrons.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Roman Stratiienko <roman.stratiienko@globallogic.com>
Subject: [PATCH] rtc: test: enable wakeup flags
Date:   Wed, 15 May 2019 14:14:36 +0300
Message-Id: <20190515111436.14513-1-roman.stratiienko@globallogic.com>
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
 drivers/rtc/rtc-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
index 6c5f09c815e8..c839ae575c77 100644
--- a/drivers/rtc/rtc-test.c
+++ b/drivers/rtc/rtc-test.c
@@ -123,6 +123,8 @@ static int test_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, rtd);
 
+	device_init_wakeup(&plat_dev->dev, 1);
+
 	rtd->rtc = devm_rtc_allocate_device(&plat_dev->dev);
 	if (IS_ERR(rtd->rtc))
 		return PTR_ERR(rtd->rtc);
-- 
2.17.1

