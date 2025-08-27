Return-Path: <linux-rtc+bounces-4771-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFACB380D4
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9819A17F8F1
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D38352078;
	Wed, 27 Aug 2025 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/ytBtNS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ED5342C92;
	Wed, 27 Aug 2025 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293801; cv=none; b=BjVvwKBRKuiqDxKRnrH6oCW9BvKTTQkYx4bmUMiheY/g6L4MX+fYh1+gsHrEmQsc7YEK65ZTNSUWNVqyfDNDBzDT42Vi2lmxIeKCDjKGX+aJ4baV+z4bHHGcc37mYa0/LlyhMydRocQV/5dhQqCl+e3G4sQdNby55hGXs6jcaYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293801; c=relaxed/simple;
	bh=VOrW2GfzJb6imZqi+U2s8G3s2QEeizLHqMoRRpb/nIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2tdFCDkW6FdliTJDkJBPRkq28zvrwnj0DgoMsbzwTe9CdpnUSVqdNhaDnoii3gR9xcFV9T1bo5mEGuosrnXBGOjicQQwFtY8jDOM1iV9KxxhNyyeZ7wBoCsYDgPPNWw4P5cm3NYIvY+UDBi5qImJ+V5BmjSXMfVp0ix7Bc1XCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/ytBtNS; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3253f0c8788so5603162a91.0;
        Wed, 27 Aug 2025 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293799; x=1756898599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRHVnpg9jOOLhSqBOjWKSbJGnSs0q1UyU/4Pw3oBr3I=;
        b=j/ytBtNS4meIzRKho3vJ8kVan/qIIlEl8bGdDsNEDvG2fzctpjOJT5XfR21+vDpIkc
         J8sY63DDAQ6/yaa+TgoBaVFboMSfX+warCcakZvojbouCPrr+dpui5EkbaVbNh5zyxA/
         GUj7k3lSRNb+t7MoVf00NuTdBCntZX3GXSe3M2vbi4d5YOfGy00lBhVt4C9MqWlixicv
         oFXIP6j4AXJG8mcDwKPXLAuE33Uk+yGI5FqxGyctzFXaRThsH2ebQDWQS9ATYN85jdxn
         T6+S3v+MP+Ohfewc/XVvjgkXMq0GKUA+yfW66GPT/CKVFoAgEv3zsKpggWfw/VtlzdR8
         qIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293799; x=1756898599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRHVnpg9jOOLhSqBOjWKSbJGnSs0q1UyU/4Pw3oBr3I=;
        b=aT53kcqkNyDmDKOUawzirkVz4t53xU4K9BzTJntjQ2LkGoGphMmM8FkaB3NuKr08le
         aTZOzm+e3Otc9mJUJ1CkkKDfNw1CfDYc8ejxiPZ/ij8PsBDHFS1U09iDBrJuKzIyxSs0
         yAVDius5hNz9C1Mw76paUA8vi0qThx6lSsGS9IzGKekIZ2Wlkni+2/WowFopjQONRccI
         5K77N48hycqHfG2Kjhn1e07+ivYzaYgzu6l9LGTWOova0ji8biNXowh159cvrbKou2Tu
         2R9mToYPyGbevLu8nCQXFS8EuoBp5RAQ3KlH7RKqUjRpe8FQFDYsAoC9C6bG6CTkmUOG
         1yVg==
X-Forwarded-Encrypted: i=1; AJvYcCUuGED5tnUjRL0p5qcTAPzmcaqB+qAhgMn5nq46t13YMBOEAqF3GbO7Lxd7Ye94+uSv+2wMc53eWarxWu0=@vger.kernel.org, AJvYcCWv9su+FYLV7nZ/FOz3OAQ1wedhGY4T0yv4MQkIgdHvc5ZMwzOGNsVIV7tajWJnyZkR+UL0TgyGczB5@vger.kernel.org, AJvYcCX1KT2G78fct05Y7Df2vSxWE4iEuUwo8YLZVoh35o65gbgNjJdWPAukpO36Qt0rrt/q3uEJYzlzt5Nx1ge9@vger.kernel.org, AJvYcCX5MN8KhMIGimUUhseP1Jxgc5o2gYM8A4aL283ykaMWpIjPz6rv5U08XVpDuxVfREGmshOGeZ5W7mvs@vger.kernel.org, AJvYcCXazEgTO8B9SzPMG3YYC2Zk6iufrGtwj7r2lEcAbh1UXK3+9fKxPIlh/TUGsusmZQNueZlF9kNL9HI5sek=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjU3zP7mpTup/yINHP0KJK4UH1ss3HeQcVs+fksYcjK+Ds6K9z
	mXOhRYTvOIucB2KpIvnhE71Ctxq0/6m0IOvREo1RMPVgrlT8r+fF2da/
X-Gm-Gg: ASbGncuALfopzKoUMMB4Bo2r1/s5TnK726ludQbl9//8hjicVChJ+JHVx6Z2NDKw8NG
	20KltVpyaYFF02iev1spwlkx2t2B4QzUv4qm6sPUsywDUdk6CWe//cqlSpVcyAXEYNOI0uG4Oob
	ftlCVbatQ2KRsU1pj2oSB2XmLmRp34KfVFIFA2yLWwmbRQ2uHUnmsDUO5n0UMO89xp8RnVBOt6t
	vjUJPeos2sNhA3YQ/RwUpJncECY+rVnzrKP8EvNTUveOUI1Iiy9icM84AooIznTRAqvSBSQGLNk
	KmYj4xm0PCXaExdHc6yVXwCNavcllN6pP7VsqEB20gOTCni2N4VdgHlksI6Vue5XnmeMfxTnDeH
	WePmYcHzcDewhfw9X3frnDHiqmNTIA8UsduD0t21pSB7MzmMMkxFlb60dVWNk8aZN34I4hDP68t
	jQbjOaDFqKHOxnuM5i0NNdkLmYQJ8=
X-Google-Smtp-Source: AGHT+IGazgBF7dBdHwX3f8CSjkteviIi1P6yshCO+mKyTVKYMXEQPnfM8dJAfOCjG9kzcJT1WvLKrA==
X-Received: by 2002:a17:90b:3e44:b0:31e:ebb6:6499 with SMTP id 98e67ed59e1d1-32515ec135dmr27101965a91.24.1756293798966;
        Wed, 27 Aug 2025 04:23:18 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:38 +1000
Subject: [PATCH v2 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-4-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=VOrW2GfzJb6imZqi+U2s8G3s2QEeizLHqMoRRpb/nIs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW92MB4c0NY3kzza2ESkqr5ug7N3ff//Q3gcdhkG
 GrodOBlRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABMJ2sXIcCBlW1rgMjN/5znf
 ExM2rF4ZczxhX0kf064y0Yd5wdN3RzIyTJ2y3PDT9O8aRz79lH238vDDxEsncws9+a+wr25iuuT
 8nwUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8fc0e905c8934c2636824cbe5d527..59be894460d33afa754927630881532b548b7ad8 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.0


