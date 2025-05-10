Return-Path: <linux-rtc+bounces-4085-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A9AB243A
	for <lists+linux-rtc@lfdr.de>; Sat, 10 May 2025 17:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E54A04AE8
	for <lists+linux-rtc@lfdr.de>; Sat, 10 May 2025 15:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DBF2253A0;
	Sat, 10 May 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrwcGYwB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717551DD0C7;
	Sat, 10 May 2025 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889826; cv=none; b=KhuTQcAuWlrkW84n2q6bi8kFhTRMoVPycmWtQEs6DjRY1an42yA7tPTcegbLrPx35z5QH53MD7BXQqEth2YstvJt4fJXO7ZK4jIaaZ4Dg8SQeCKHM/vebMmciolwI180RUdz1MdnqFovVWfHUPAbJ+mZe7DI/DOsWJHV6ty7aWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889826; c=relaxed/simple;
	bh=fj8vk2nF5Goc0jM13PecpuLrre3yWedEKp7zIwxRSro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q6Rf0NGTFAV5Dhn4xvjo72YRpenka8q70DPZIPmU/g7mvmD2hLJnbf9MqvcS5ctL/fwCsX70DJZg16/7VR45rW29XAfaO4aI0Ouis6WJrOGzHg5/YGsvTTl2AcTWXytBXMcvDw4lBmRWTKIm/0kJ0F4wQsAL8hLlhDa+PKd5VXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrwcGYwB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74248a3359fso1101757b3a.2;
        Sat, 10 May 2025 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889824; x=1747494624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5NjWbgd+215NvmTsJYPIGQXgwcjX49aa20RxmgDo9M=;
        b=WrwcGYwBoKexy9y5cabZ/8bAgDVwdnz+WauieKUKki9S6BPhmiiSJBBg2meK8PUu5z
         ig4Pgy32Hikl9Vc9FonPpzTaTNaP6tn56wwe9RNm20rs7dv3/9+zqpIOHESRHwE4Ibn5
         hpILcEwPZ3jGCKIKWVv/ph3p8JwJ12pKnkqMGK1fyzz/90ccF1XjGArl9VK2pCdrar1J
         IK2B58ttcbLOPnN8fXiWyFtS+q6A8vmqwGqK4F+nDiAp2JsuyR5hp+dDMgo2dFIe8RG9
         CWETOthkOUQ5twVneUcC+yQehscCom2Ld4XH+24js6gger4z8LqZA28KVZxRBysU5ery
         /ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889824; x=1747494624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5NjWbgd+215NvmTsJYPIGQXgwcjX49aa20RxmgDo9M=;
        b=MbTdJoEwB7+7fuxjEgNGJrIsfsQYdmAZnY1NkJzIqiYJ0jXTbiSQucRsHCylWMmrV0
         WbuDP2PCf46aO4iPf0zlZFGHt3/HGrkCrXjqfG4KEJUoNP2n14wvhRVaLfyED939wqXP
         MODHAPLVCvWyHuChD8U3pCN3oWD1Te302Dtr1l0kTxdqm8CAtNCaV0+bUH0JQOLezg4e
         Qo0atwmopGsXD8mYWj5waUnrnBaHK6rp0X38AJ4M8AKXmdRcw4w+D3+2yXVZcLN6psQM
         NB570pWT2icQZ3O+7bAbhfMGtZyPIgaxOykoW9hz18F1XT5sJrKgKmU/WWDcIA4y/Sk8
         4fQA==
X-Forwarded-Encrypted: i=1; AJvYcCVSj0WqDFnZsl7MYVK9Ci3cWtugcci5x68GIMi4DdkFTPy5wE9pp9ulwSi1ZWSPGU54WQMIAoA26EdLytI=@vger.kernel.org, AJvYcCXIr0X4zMQcJrwp0ajYnUngIYR/2IyIp91P+kAbOuUmR2whU0/j4CfeBaQxCe0B7CrO2e+A6PIQ@vger.kernel.org, AJvYcCXbM4zX5YIUkYPBhVOVKOlISsZglKvvHtj59Oie8O5aVFD5Rq9qmejTOXyJ2IUFnyUjRm2QfejFXWdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyhbngUzuxsi+0aAhBHTqwgEHjoFMjwhqYoTeGstXZEF7taaWwm
	4oALVYbedleX1s/Jq0pEIHVx7se/W3qvFFqIxu5WSNpoFoiLc1Qg
X-Gm-Gg: ASbGncvTF0zf8ByiTKjHGDszoBS1KCMHlW4ZW9qRmfIW0QcVYPOaNjWfpcF5aNDqg7q
	IIk9ioovmGvnSvdycLnekO2edyWErofisNsqgDt7/P9hGX/m5Y1uCLkF3e/MmMHuI4HAoEdjDLS
	UdB6kXtRxTGARdJmZH53gjh2CXY9OTdDqDtN4bPjvZR0JWxlhG5NrwBB9eJO9N8Dn5j6Fdpn6QP
	MVwXDPhiKrRPMIQvjKcydPLwp87FaGoC+0SCkvMGawTzF6aA7pOcAyqtwLwpVCqvCWji4C4sBS8
	/fhdqw+XmwIgwlpeoj2zbb7EVpTojQ11702EiM9wNm+sJz4gYZ53+wnzQmdF4ThfEa8C3S7WpxO
	RuCnf
X-Google-Smtp-Source: AGHT+IE4QDBGiCycNXUyjCPkwa79deYcY277mu+wqZuo1qApUC6KJqFhsxYVGJVK7G71naCt3LuLbg==
X-Received: by 2002:a05:6a21:e92:b0:1f5:8678:1832 with SMTP id adf61e73a8af0-215abb8e35amr10807619637.11.1746889824477;
        Sat, 10 May 2025 08:10:24 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2350ddb4cbsm2990428a12.52.2025.05.10.08.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:10:24 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: gregkh@linuxfoundation.org,
	akpm@linux-foundation.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] rtc: fix data race in rtc_dev_poll()
Date: Sun, 11 May 2025 00:09:44 +0900
Message-ID: <20250510150945.18387-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I found data-race in my fuzzer:

==================================================================
BUG: KCSAN: data-race in rtc_dev_poll / rtc_handle_legacy_irq

write to 0xffff88800b307380 of 8 bytes by interrupt on cpu 1:
 rtc_handle_legacy_irq+0x58/0xb0 drivers/rtc/interface.c:624
 rtc_pie_update_irq+0x75/0x90 drivers/rtc/interface.c:672
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x2c4/0x5d0 kernel/time/hrtimer.c:1825
 hrtimer_interrupt+0x214/0x4a0 kernel/time/hrtimer.c:1887
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1038 [inline]
....

read to 0xffff88800b307380 of 8 bytes by task 11566 on cpu 0:
 rtc_dev_poll+0x6c/0xa0 drivers/rtc/dev.c:198
 vfs_poll include/linux/poll.h:82 [inline]
 select_poll_one fs/select.c:480 [inline]
 do_select+0x95f/0x1030 fs/select.c:536
 core_sys_select+0x284/0x6d0 fs/select.c:677
 do_pselect.constprop.0+0x118/0x150 fs/select.c:759
....

value changed: 0x00000000000801c0 -> 0x00000000000802c0
==================================================================

rtc_dev_poll() is reading rtc->irq_data without a spinlock for some
unknown reason. This causes a data-race, so we need to add a spinlock
to fix it.

Cc: <stable@vger.kernel.org>
Fixes: e824290e5dcf ("[PATCH] RTC subsystem: dev interface")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/rtc/dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index 0eeae5bcc3aa..a6570a5a938a 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -195,7 +195,9 @@ static __poll_t rtc_dev_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &rtc->irq_queue, wait);
 
+	spin_lock_irq(&rtc->irq_lock);
 	data = rtc->irq_data;
+	spin_unlock_irq(&rtc->irq_lock);
 
 	return (data != 0) ? (EPOLLIN | EPOLLRDNORM) : 0;
 }
--

