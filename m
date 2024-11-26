Return-Path: <linux-rtc+bounces-2620-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F29D904A
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 03:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C9341689A7
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 02:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE9F17591;
	Tue, 26 Nov 2024 02:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="hwDRYcre"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341EDF51
	for <linux-rtc@vger.kernel.org>; Tue, 26 Nov 2024 02:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732587125; cv=none; b=TTiMBP4/U0pQKD7J4CGHhDmm3M5zBeO09DwkpU9exz3w2XsRy5PspbVwoMwkgKbBfn6t1zh5GGr2OGLQFs2RYrVN/qBGjnG2NmSjwkunCAWNId+lAeQ2hEIhFLKUGVi23LBZWX3C20slTnqPE1IdUSpaEHdmIBuKFMgv2DqUSSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732587125; c=relaxed/simple;
	bh=k6/rqYlrg5hMF314HzDa1p7Jh5wFv0Ymp7Lpy+rB0X8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bcZduzi48KtZqxfKNlVyB4Ljt+/EqoUpn0hEd6RBYoQLreGVfDpAq7Fus3AEvavz4pqissd8V5vhQj7x5eu5IGR3lsov8DgX0keetIBkkSp4i6QSPTYsvibDCUOrGxN380x9yMTor+jbhND4kkvMHznkzON0869SsFbizlbQm2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=hwDRYcre; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso4255551b3a.3
        for <linux-rtc@vger.kernel.org>; Mon, 25 Nov 2024 18:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1732587123; x=1733191923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNHUUKXO4q7TqPfGqvqJumsv+WcVJ+AaiSb7jm44jtg=;
        b=hwDRYcreeMcfxenrx6U59oA3PZrIUybg3VRi4xKRaW2YD/fS2MX+Zv4E+pux2nVgF6
         HC3UTP0L5znciNcq2JnSZq9m/tna742XBQJfjUs2t85Cg6krC3FAi3dHyNtbiAEqgJ3q
         ZFx8pems7k8ISKNJalTVo5DwCKkUS6CWvry0QoGXhGgCUReK/3LYJmVGPlEUbVIf3F+1
         l3SQ/LuB8X4/x/8HkT2fBcZJ0yzg5lXEaJzoygFLaSBuZr8cLUez4v2t2Zk1zGkm7s4p
         0IjzKwUCQzUMc3huMLCsV621h5n4tajGRI0nyPN79g3UoSawPb9AuMdAd4ctXvdo2rge
         tSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732587123; x=1733191923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNHUUKXO4q7TqPfGqvqJumsv+WcVJ+AaiSb7jm44jtg=;
        b=nrwYLHl9xcuzPVOMzN9YJDnkEFzXff++jk6XmiNjf4ICnJkiWMGi6jQY2khSZvhHTg
         OKju2m5ZDPq65fMTLjsk7jjK6+p1qQoJAC7PUdihFkDkiTAgOdeFdkZTMggsSl4OX+x/
         YHaJIstimuq1uxx5uuM9ZKfrSWU3mQim1Y1lFEJgKzR5VH76WNvKetQNHm4wNhgnI0Lw
         lcK/0+QhKLtHV8N34HzjXJ1V48Nt1b8RfVfwjQ67ESxg4cH8lE3v6LzxfDsngNGlcOUd
         Mxg4I+/gEUcVlnqLMynUj+Vb4Qp5t2RvgcEDE1510EOaqWKgPDIxr9jrGqsxtkYADWQ/
         HH7g==
X-Gm-Message-State: AOJu0YxvztccNQo1paTtYbsnuMB3eczdCoH+1VXh3CdPQ6FpMH8b5jFW
	88KcxfJDaBTe+gXfizMbl+p7kMyoam4bgLoX348+qwlMbYkNmqrWfT/VyFG6oLE=
X-Gm-Gg: ASbGncttbnc3wIjaomKnK57Gzb8YH9oqfPGg+hbRfinpE4A7PtocVBhx+OoVaO2WBTK
	S8aPtEHJFF/XBMDiElkeX7xIKwLEosKMXHaM3ygAJkPivA+A+PnP4XB2aGMXfC+AXtrVr2MpMvM
	6xNsYLMjDIm2unteuZNVxVlhd/Q76BGzHqNaLfGkyYQ+OhVaRo+kRMLZXTx+6Y/hy9W4cHOwz5P
	Oc9jP8QIV5ftB38dz7b/LRiPUaq/7jLuytRIfCKV1ZJH9CoeTU+c5w84Zm2Yzt6uCXILFlWXxXb
	h7zk67CD6FD+OXhxYVFm5X+pgXfZv7ZQY20U
X-Google-Smtp-Source: AGHT+IFCytjOlfYbVO+Rwasokhoep38yI/Pti/GCHC3eJgTadJIJtbA9m7NlG2XzFf1jvggI5tVTGA==
X-Received: by 2002:a17:902:e844:b0:20c:7409:bd00 with SMTP id d9443c01a7336-2129fce2dfemr230577905ad.5.1732587122736;
        Mon, 25 Nov 2024 18:12:02 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db88ff0sm72490545ad.53.2024.11.25.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 18:12:02 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: ab-eoz9: disable wakeup in the error path
Date: Tue, 26 Nov 2024 11:11:53 +0900
Message-Id: <20241126021153.3713330-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the error path of abeoz9_probe(), the device is left enabled as a
wakeup device when it has "wakeup-source" property. Thus call
device_init_wakeup(dev, false) in the error path.

Fixes: e70e52e1bf1d ("rtc: ab-eoz9: add alarm support")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-ab-eoz9.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 02f7d0711287..ef61c5d5549c 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -559,8 +559,11 @@ static int abeoz9_probe(struct i2c_client *client)
 	}
 
 	ret = devm_rtc_register_device(data->rtc);
-	if (ret)
+	if (ret) {
+		if (test_bit(RTC_FEATURE_ALARM, data->rtc->features))
+			device_init_wakeup(dev, false);
 		return ret;
+	}
 
 	abeoz9_hwmon_register(dev, data);
 	return 0;
-- 
2.34.1


