Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C325255DD31
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jun 2022 15:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239653AbiF0U74 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Jun 2022 16:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240838AbiF0U7y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 Jun 2022 16:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1CB3CB7ED
        for <linux-rtc@vger.kernel.org>; Mon, 27 Jun 2022 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656363593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=P2ALvax4QLHT/PRvyeFgcmdY6fh0+YOux9iV3/Np/Vk=;
        b=Y29qWUrlqf03B+L6OAuJdhR2OWQz1XZcYgznKuO1oFSdowiO2eqBXnMJzKNDMv5SvUJay1
        TGV3D0ZJYcvL6o/8pO+6qIisQu8hs+o2hUtf9DaZryAxnqUENan/nvac4TJ/txFae5B6y9
        CvTBFOBBx7mM3JbHmKjFZYfAZPxVgks=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-TqpGlZRIN8OVOkiKPFReow-1; Mon, 27 Jun 2022 16:59:51 -0400
X-MC-Unique: TqpGlZRIN8OVOkiKPFReow-1
Received: by mail-qv1-f72.google.com with SMTP id b2-20020a0cb3c2000000b004703a79581dso10390083qvf.1
        for <linux-rtc@vger.kernel.org>; Mon, 27 Jun 2022 13:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2ALvax4QLHT/PRvyeFgcmdY6fh0+YOux9iV3/Np/Vk=;
        b=eZLN6IbvetE+6J6fVLzngO1GpWpyLAQZG3Sy7cIMrelBrkNelC+VkfF45X+H/vww0Q
         zXsaj9jsMLvOS/ja60+FtM0AO/ysfpd5ltSr83ycILZ0V+lnyKY9YSoQsCUKiHljWFKa
         +sGiZx+39vZyDO7vyE8b17zyiJIAZ4fsC7nU3BFZlBLQFp54qbe4U7upd/6/jXqbfX8G
         KVWXkxp15QRxvRDYWBVxcj1gvejJQuo9EiJ6j695fV8Yi/utTqIIXGwpUX44y2P+PxQO
         D/+UMduwdKJ8Y+MdSxsuXJOygLUuMlcLFP8FDKspAg19EooaoM7xVxshNZ583y1Bw9hd
         4aMA==
X-Gm-Message-State: AJIora9q4X80ycSOZmgHe7DSXKvxJ5aVk4VUl59dMbSMwKoyxzlR3bHS
        BRmHIN5Qk0y+qQ76Ks14MCc8vF6JuhhvA4OfpyXglGOpjU3ZpH2TmPew1JLSLBKNvAde/VUfXt+
        0Y4uLdcIC1mEHwbgBlYKA
X-Received: by 2002:ad4:4ee4:0:b0:472:7778:ff86 with SMTP id dv4-20020ad44ee4000000b004727778ff86mr1162009qvb.109.1656363591486;
        Mon, 27 Jun 2022 13:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOGQ37j2Gu0CzjFIVikcF7haS9EBEvbksI9EbPMv+s+mbkvrI4aOi6vEzPyMNbkPK8eNqn+g==
X-Received: by 2002:ad4:4ee4:0:b0:472:7778:ff86 with SMTP id dv4-20020ad44ee4000000b004727778ff86mr1162003qvb.109.1656363591235;
        Mon, 27 Jun 2022 13:59:51 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x9-20020a05620a448900b006a708baa069sm1787831qkp.101.2022.06.27.13.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:59:50 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     lewis.hanly@microchip.com, conor.dooley@microchip.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        daire.mcnamara@microchip.com
Cc:     linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] rtc: remove 'pending' variable from mpfs_rtc_wakeup_irq_handler()
Date:   Mon, 27 Jun 2022 16:59:43 -0400
Message-Id: <20220627205943.2075043-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

cppcheck reports
[drivers/rtc/rtc-mpfs.c:219]: (style) Variable 'pending' is assigned a value that is never used.

The fetched CONTROL_REG stored in pending is unused and partially
duplicates the functionality of the later call to mpfs_rtc_clear().  This looks
like leftover development code, so remove pending.

Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/rtc/rtc-mpfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index db9c638e50f7..f14d1925e0c9 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -213,10 +213,7 @@ static inline struct clk *mpfs_rtc_init_clk(struct device *dev)
 static irqreturn_t mpfs_rtc_wakeup_irq_handler(int irq, void *dev)
 {
 	struct mpfs_rtc_dev *rtcdev = dev;
-	unsigned long pending;
 
-	pending = readl(rtcdev->base + CONTROL_REG);
-	pending &= CONTROL_ALARM_ON_BIT;
 	mpfs_rtc_clear_irq(rtcdev);
 
 	rtc_update_irq(rtcdev->rtc, 1, RTC_IRQF | RTC_AF);
-- 
2.27.0

