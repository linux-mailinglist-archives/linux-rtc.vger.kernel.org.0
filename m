Return-Path: <linux-rtc+bounces-4775-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B6B380E8
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 625B13A72DA
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDD035337F;
	Wed, 27 Aug 2025 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+A2dlTn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37FA350D5E;
	Wed, 27 Aug 2025 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293828; cv=none; b=BPNYRjlGBeFc5W8iG/9SrDgzHJSxifLtHkTSjUX8/ffw5QbIMY4dCF5Eut2HwfUk2EYN2ugXsY0tGJmDT7nt8nEpIwXrzgfLzXBkJ7zWuWgkFtoipLapFpX9ytAFFlViVdCj0x/qPjMyeVdpAwIpJLN3h6Yy2OFtxGdOJqfAnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293828; c=relaxed/simple;
	bh=xCTwt54W2CQBJO75F2Lvz2paGIMG/Mf6mnXKlTqhQ4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erYVIal19DR3XnUtyfGcGSgHvanVUmm8aizDb+CStZGJXVjH6/twoTptJAQdJn/PsjB2bWp3vY5cQuWWE5oMZihvLOXuY/spb6k0kvpVRBl7uTmEaf2pY4MV/1+S5GHbtIJwxwGUsjIHv+CFrQkrckRsLmY5rbxMawVEzj8FDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+A2dlTn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7718408baf7so3590955b3a.3;
        Wed, 27 Aug 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293826; x=1756898626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z529y29TIOOGxyh61oY2BQwbjfmwK/ol2lbcYwZ434w=;
        b=V+A2dlTn7Rrupqzuhe/VJddCFThUre0miaNsIfW5PYOnLg6ZYkxKEFFDVONf1P9YIZ
         GkvvZoLqWcet2iYf1u/5eLOAiVCANDQla9veV9e67tLuV3CfnfBi9Usk1GUAZ/86GkNV
         eE7l145KtXcRejjW6ausTEHQGxDJ1uhClnBoWxPW8SOWcejlcarx9oLFnTIr+jDdyTjr
         it5J/UikozrIXDbVtOqWXVuq1qvBthgajXvcpgcXdjOyvkqX3z9rfzx+hXzA1ELi1wBU
         J+dvY3NIp+yXAHrNzYK1zL2zTeov1KI5xqqIVhPHReXAEhHL5c9YKEMioxavEhzJ4FMw
         SSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293826; x=1756898626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z529y29TIOOGxyh61oY2BQwbjfmwK/ol2lbcYwZ434w=;
        b=DoEZ8wPQ5eeZE5RqrwZzNPbtPOuopPuFcwrOWfm99PiF3c0OmPv6Obie/DHkXEmcgV
         EnKhdfEFdCJ/n8ojIJrU73r3eFYCfMLXbP2owd7RXnQMLIpRbdo+lric+zVgVjBjyafz
         U48AfEE5p6hmMjL4k796l6FD28mCQcwgKuq6KcI34QMYSOuYuP/z6ErQaCa8tp6UI7gv
         Uanv4FChOaFsTLaZpMa+kcYgnxLMJFHupwW6GhXGMuV8tjdBxhKFyumH1ytGmtBxJR35
         DxjlLnw7vP5kN5O2qvSZKEqn4a9ROnl4s5cfsSYku8o/oVZSuPUInjOcpMMPha5a8Zrc
         bh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU85QbwDC5SmLcCs9dWhwrDXD9unF+GKIqu868yTRBZH+e/hrMp2zOy/dSdmgfbCXSzR1tg13xMxpgoj/Q=@vger.kernel.org, AJvYcCVsXTzl9He6zrQ3gQRD+6B4LqAf7i5E4AzBclA7li/Es6bji/ZC4a7aJtivaJPTLdO8BNcRlf5FjSTkG0tA@vger.kernel.org, AJvYcCW00h5kpxFpoLhTi2s50eNqeSDt6lpDxeI86dRqW2yZZtJvh6ycNDsRolvPiN+Asp4GGj1O6M8kYmvEDg4=@vger.kernel.org, AJvYcCWGV5vl8J7WQctmAIbiGL1RfMNng6IlNjRKEnuH/Ld9ssy7WswS0xf7Lt5d+CJwl+WbEnLZjYf5qKSh@vger.kernel.org, AJvYcCXkIr8xhfOjDWnRHuD9Boc2K9fUDRpYE9O4ji5y1Et2ugMdYoPLy6b4q2Cl4Tdu7o7a5bp5akd83SOA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93YDHjPmTz0NqWiAi+VPAOJhi0fTjyEczfuU3CyBejbP5Iylc
	AFHnOVLVuBLxGWHf6SF8DW+WQsvcE4fEp4nSDi9/5gyKJmHXPAydCJBK
X-Gm-Gg: ASbGnculYm6qymG3vYETlNgnHY+9fvGoMlA7Fqig2EmqeEWo5gv6+pTMocuQ0DEYryb
	Z5OM1yc9kYNzdUD0mHkE+eeMkSKZWNWdhHxaanC8/eqojoBm26dfgLDFaEwH+njTxUG/jYGF5JK
	Y1anlaXKuyDh8CN1ZITB5/HXddpSA3RBpqv94+RQS/hj1IVIekg3VXJGb8RRlxnENKJrNYvn3hG
	nDIT41mfgCiIHFphvieYmQFp3yTh1/pB/D0LzBI9ma0U79Jz8XVXuoTtcYsdxTorJ1vqZlO2hyq
	CbVoAzaXBNt8fHMhjOrrhrxnMOc5Cfzv6QJO7P1Co9P4F0AyY1rvmaHyzyKMfUb+vZ8kvcTPV5S
	A7CvDwVtwEFJXIBUTYvtLCNzEuUsYwj/Vpfjp1KDXdy3D/6I/BaHtc27egI/fLWxqbtfxWq0A82
	dn34+w5uHUThOAlEeO
X-Google-Smtp-Source: AGHT+IG1I34LBUT0TKwrF5NX7fXsjRB/PM9YKtCnoAQa/Vc6sojIb33NnLwLORwxlipIekaFiHkkCQ==
X-Received: by 2002:a05:6a20:72a0:b0:243:15b9:7660 with SMTP id adf61e73a8af0-24340d6e2ddmr30868600637.58.1756293826022;
        Wed, 27 Aug 2025 04:23:46 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:42 +1000
Subject: [PATCH v2 08/11] mfd: macsmc: Wire up Apple SMC HID subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-8-ce5e99d54c28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xCTwt54W2CQBJO75F2Lvz2paGIMG/Mf6mnXKlTqhQ4M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjVrS4q3nWUJLd3+9z83o8Gb9w8fnvFzvL7gvVyM+
 PLnXb4HOkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZjIN2FGhktv57J8Yqkzq9oQ
 5RByS8mkQ6ZLSuX01I/+idKtkRcitBkZPisUKE+Zo3y1/VqA0Mon/Xapaf3bOKWX5m7ivGOp3jS
 NDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC HID function to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 286dc150aa6cfdd6d29f769094278daaddabe7c3..893fc47d62b2c956d966d1841895a3fa2b9a3005 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-hid"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0


