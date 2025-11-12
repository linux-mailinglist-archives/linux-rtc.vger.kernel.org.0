Return-Path: <linux-rtc+bounces-5319-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61AC51E56
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 12:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2968D34DA21
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 11:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCE33112DB;
	Wed, 12 Nov 2025 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU6cMCxK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6DF3101DE
	for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946309; cv=none; b=RSa+3wz+aIpj5OINgruiK++odfUGYIiiyUxWkbBMy3FwWtbrVONkVHfTc5X41NAmPuG+OdoQZXJRN6tw5ykTGL3D0F4IZfZQpu9DPNjI35Hz4wHl+TxWHq/2iiVHCjVPhJheMKktiLDif1jYCwkolGhbGfXk7wqVJN0nyJ7hUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946309; c=relaxed/simple;
	bh=KDo5qf6VinF0dcocAqVHp8Ouk8wH3LA0jZpPa6Inudg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGNvZIYdaDXGKlgRyev9KEI2TC3uTyESoLFTpyIcuo/Yy5v1VBqYvwJO+Ham8JnLyfyOCCiD/bxK82KnGKh4pZRvB2B7l2zIssGIIWeCAs96sVQGso9BpgHCmDaL61YwF7VpjQQnzIcmqobuZTM3GVIo7fSxMZHRXmrLjaJcF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aU6cMCxK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297e982506fso8450605ad.2
        for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946307; x=1763551107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=aU6cMCxKtR+CE944lWsCiO5Dv1DxnTnVmxFZ7J4TcQLZZvjBVkHwz0xcu72s0og5Dg
         xbZgzyyjWlirg3gL3kmcknVELZshT9neYBuko4L6oQo4dRrEf5SJ0+MGCUky2xjlC8QB
         4pIGakWQJqEH7qjPnAeHmXUD6mOtPrvWWvTYpR3YgQjiz9e2THUxS7P3LZ6XVmpklI6Z
         QHHhBAoYDElCWToX5rTSG6ptOAJUBOIvWFe1FDBcw8XLh9HAVqrFCBv5UljjHgASg1iA
         J1i9Zf4J9CDWnmZvjsJVv9jI2kN3mXOC/x1qnNhVSA4MYOOjrVubVdUudeyLSb+HnZjy
         W67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946307; x=1763551107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=EqFhr1YhW7i50JGi71Y4m5QtG9zYbrGLa/5VY0jLKO+/7Unh3SbClronfKDYANcdqx
         PaqbQ19oQgiXJaAZ/L166sjec1MXy1wO/VlLARdjziD1CQRXDO5z9L5Bn4YjN3RSQcxj
         0mXRR3gOLwERN/WVsmFHM3602JMYYnYkqprlyoNjyAQF+BqX4P3EQfdI/27L0x69IrrG
         qzyLkquyDU/GGGRHQOgjXch8pyjnjJSvfGewgCFZa5mZ8eZ8hrn7h9b00IQRKs3DeDQt
         2cmTRbTmMzGS7ONi8X0UYBn3Q/NdksIHhHh2ixp2CkVf1Rlyg0RmLqlyZb/ERMEdfm4X
         NfrA==
X-Forwarded-Encrypted: i=1; AJvYcCU9parC4T8fzjC4Awkmh/XWuZ6UIDB+9etbC8ELncYRpM/ZaKxB4QPY+zRAPpgXxYq/xauVGa8KfoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HroOoicdhFLRkXrMwvkYDBVdBEkSgMBNpw6cOMEuXs/VSPCK
	Ib4UDFFOJGjD4vSuV5ZaFRGuSMbNMRPKF7UrxX4+E3KYJ6ZL2vGRhAcd
X-Gm-Gg: ASbGncvBDaYb/eQyBo+3ukPnE9bqcHxPdudEGcHPaL0Kz0UCFC+1JJfbb1Zu73LkKHE
	ANyCi4ODtK6E2D4md+VF5BgfR+0tbUUhsijh/fkFqotwMpPwsc3PM/kvO9vX9cdn03kN3PUQ8N6
	cLIYyQqOv/RnJg+XdPWHXfYxg8j1oOBuHXqVrvna4iNnP7WxporyS0bpQWr/kcj6YFnGafnaBHJ
	YHXnpNbjgzrvxCESY4iUIFKw6G+1/pxCxL5YYaaxStIsK5+0pQSg6f3FgCgZbEAWt2IVShig7V8
	yvDn+5enG0i8eYoEg+W9JZvoCdGfhs7l8EjWUtBnfkM2cXcSqVn113kKvWcZYXG8oCFKNsJwYMz
	ZrQcMa2ZG6+KwNJ11nNkzjPNoJeftRdBxnAiqQLWKNw9MR8LOFpAuIiibt6R72genDYpk2Mo/gX
	Fv/JJ9CQUKl18CPNSr4VtacIzJL75B2x+WIGS4kXasYo3EPdCkmm8T08kMOhMSauVQbpzbrB2ct
	5l0R265M9NBjV9SAIGR1CXlMLUzK0yDk7csAGIRMLqjrkaiPxyeUBGJ/f4ma671AA==
X-Google-Smtp-Source: AGHT+IEImt2oq5AVyAyincVqTizrLP2oINP9hgu+RQmDQEbV/h6h5zM29LTMvGX0qa1Tj+zk9/lS9g==
X-Received: by 2002:a17:902:d60b:b0:294:fb21:ae07 with SMTP id d9443c01a7336-2984ed92d45mr33420405ad.21.1762946307045;
        Wed, 12 Nov 2025 03:18:27 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:53 +1000
Subject: [PATCH v5 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-7-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
 bh=KDo5qf6VinF0dcocAqVHp8Ouk8wH3LA0jZpPa6Inudg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUdZA4+/VDxp9c31mWLPB8Z1xzU9H8o5bWfLi7zwL
 fz9vPJZHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKkumMDwv+iDSLuozZuJUz69v8Z79VyVRceJ3QsUthr+n/mbd2rAklWMDLfnfll
 6aovjr827RbynnHifxf4lfqXZyn/z+aa9YGbaXM0MAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
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
2.51.2


