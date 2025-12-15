Return-Path: <linux-rtc+bounces-5542-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE4DCBD36E
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 10:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C5933040743
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 09:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4631B32ABC8;
	Mon, 15 Dec 2025 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcohmrJV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF9329E6D
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791524; cv=none; b=Wh2bbAZMfG5dcgGXFEGijE/ahr7qbVGuF+u+FStYFKORjJfEROE5t8L+eOoVuALYrtr/Y+nwUSQJJZm5AZT6KMh+Zgqrw3uvOWUt6mOHI20SBDR+Y06sMa/L47gR2+NmkWltDVKZfGPS1qqhd518vqRIidnRrHvnUkZcC+Niq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791524; c=relaxed/simple;
	bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rU8GmPMU8ddCUB8ZnNyuVCYOBUH/jfomyYaFtylYOtXwbNlkge9z3xS4vIovl8o8wgV0CZXLN0j2NbltfcaLUldrV+EiBAlCNt4a3tC5w/Mclb3hFo6yF93pwV8cwW8aOIocevvMP2KsWEKAhqQGhTLstMMvWXllzWrtDMNu5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcohmrJV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d67f1877so11067875ad.2
        for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791521; x=1766396321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=WcohmrJVPXOIaZoAVi/8VnUN/zIaNUmh+7pEmFpwXF8EJF9pVgdaakiL3m9NQydIm7
         miA7VWJ9INDWOIu6TPv3x5Es3Z2QGiUVmn3LF9ZcBxT8QamYi7J1KToQzeBg3PRrVDi3
         Sp6/QtNNozCrh2FM5Jt1s+udMt58eLtGpT4+RutiSwoM9ob3kiAlN6gsZHZ3h3CxiPEe
         RKKmnFtdHO5CoE4Q8QUtXV/j6SI5XO9nRp24RzOJkPYjIjTqrbOhN1E0NI6GJhGQufgA
         6lr3FUNF2QFzersiKVHnvL6Ey4l/Wat0bW1BJ8feKRuk8hij8BYfLbdRJERoswYF2fRl
         7KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791521; x=1766396321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=FuwLH7oE48u6cOwnGG4o+661SGjnecqvKBuiZyXMRq8XdC4ALeTWLYxKJHN9yqezEr
         B+gKyziJAKI5AxYatLFt8w6x75L+akX4Wm9LFfks3ATvORLP05361DE81QUiUtN02IH0
         e4jkvxnOEIxyvzuPpiqgA1bMw11X3pAV+d4bGv1ty7xOqpAZEorwjDyVWCsks4ckWqLd
         h8kYMqSipiDQkkQW0olaavPyk4R8hTqN2NNLEkzgLjtaHhiYm0gwp9cG3HxbtBEOnTKg
         nsczkU3Q+Xd4liuRYYy0t/8WO67JQCodIe0Thvpy/PchOopVz4dFgI6P0QfrquEMoFAW
         MHUg==
X-Forwarded-Encrypted: i=1; AJvYcCV80LB5wKi49O7irABkklmMf+QsK6NZpIvEZL7pgadz2FfMxdLPyeTIxscnW8zzutWZVopo+Za+W5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2p82IwldWtSPSg/LW0xDLsvlODrVwP35GXvDmdCEt+pgvBUvl
	84wS/P4riz5QLPbmAjISQ2/vqmI5dSilf6aGgCe02sMrM9bDsoGTE21x
X-Gm-Gg: AY/fxX4U317GwfV2q2L9lHtz18iB1/WhzhM7HOUu7ChEB6+G7nKeCcxNvt8Vp21xhPn
	RapfewTqbr3Vhum9+E1OFInOA/BQBEeOG2u6yVW9Rjswe0djNY9WiKuDLHWU4XUIW/+m0NFMlFy
	oyQ002W+zOovW9xhtcoHlyaGRDsKuWCl65a5T7LKYwwpEbr+IHMtt+zxDIz0CmHBPmpTYuCq3E/
	Kgizs5h7mt9m+HD+G7o97LN6kX4oX3Bvzo+xSNr/IznR4syMIVc1+iPHUIGHLRfVSDEzAanc+f5
	MsaSaWIaP3yngMytRP6LbOC/OcNHgRgIo/78NhRnegz8Pt9Sle/3oJr27I2xFM4hGzI1iXpcJ5p
	iYZY4E7KQPQzS8rdBhkN5oCMD9RoQu6RclP26h7KPWSJakQ1lmGSM4EfLg/P7Sfzf4yavo9GJsL
	h5hSIEY2EE0Zp7Bng1Ctnl9eg6eTqrw2ZMVSVUfvCaK44hpvja73cBKhNBXisgNx4jr/OEqh7up
	5uyajyEVeIA9NFZj0gD6mBJh+XI6ON+lDi5cm52iXhhBQt+g6O8VMNNpfaKPTJDY7qujN6dw4/5
	E+DPlydSgl8d9y21uE6uATgpYCbGf4ztzZzxAdg22XUl3gU0BLU=
X-Google-Smtp-Source: AGHT+IGrLdLzfp2H9tiVac+SQsAe4bk4AskKgVbq1niNwYTYkBxJLkhYZNfHpCAC+5TQzOHObd9ruQ==
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr99473905ad.5.1765791521288;
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:47 +1000
Subject: [PATCH v6 3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-3-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215lvbGxWfZmTpGq3Lqym4EiH8s2A7af357WZxnZyZ
 uYn2O/rmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATPWbr4wMO1zKc7g2zW7v4HwR7C559/WHjwy7/16ymvClxfJzdduSfEaGPtaOhFL
 JJzUP5q6folLGbD4z69LuKwW/Ls+1WpDgv6qMDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 9099a7a22f1f..fa7b822d55bd 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.52.0


