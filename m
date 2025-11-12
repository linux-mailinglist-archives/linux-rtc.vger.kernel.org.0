Return-Path: <linux-rtc+bounces-5317-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE12C51EDA
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 12:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE8451893D91
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 11:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C173101A2;
	Wed, 12 Nov 2025 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bksxmV7N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A2430F55F
	for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946295; cv=none; b=sZ1JBAFO5/yePlc9p/cISABcIj8UEiUp7VRuNQu8M/hSEm8N8UUBZgLMSbcg+WdVbf8le5rqrutOJUTCesguVWjsmAvrKlChBkU8c7sArZ0g6qIwkQqQBAGJPBrzgxZxwmq7EBeizaNh3fjoyrDLebA2XcmH0vdMuD7BYWZpHd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946295; c=relaxed/simple;
	bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOVu8jGQITDAv5G5z4ggq26AY6uWgRpHshYbyXYGIEQREX+EjNfji5qhgg0FNIO3CL1+p4QEYefbzPIyaN9aWRoS6OvDCARvYW/EeR1R9KrVthXJnOmS6Vyg1HH88fQq6zEIPlgfhXUqbAAPlgMcwSDRwiseHN6CL0hORsnvoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bksxmV7N; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ba599137cf7so640288a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946292; x=1763551092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=bksxmV7NhAfJOfVVXpYwCLqkXJZnvmfYJgUt6D3L+x/lVF2MNTVa3I+nR7mDjTu0Sr
         HX/fvD/EGFUr4mR+Q0lHjXky+kUeP00UzTUUThQZMYIo4d+DISeEc0YbAIeIxdMvr6JE
         dBnrnp8KhSUMJoXx26evMA8D1xQVK6qX5PIhhmFE5P1kKrEkdM4O4d4yGQ5LEoyY0Osr
         h1g2nId3CC6R1G06Ak28izvx73+/pSRGaa8EGVRimKd48g2453r/b4i5qV+coCYwVVHP
         qS++CG+Zo2ey46b9VgFSr0pSE3n1jLxx5trbKzPQfZY9nnG2jujo2esNj5aXw1XS8Bz7
         TOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946292; x=1763551092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=PXKXhjxWbXE5Cqgo8cinVZ2MLfilokPxLz3h31TeEmmfz9snMpTbke1HbtVVGOwfG8
         ZyJRPBIpXu8w2VK6jtIlaKoJbppBKTU0n+iAcOta8XOBXin6/D0eAG6ga+FosbMA4fdn
         ypoFHlkvQjHOWlLNDptIru9dyJqxEk5/j6r2+f0gHZBtISJKmNHI6IB6NeDJHNMacnWI
         LLvfNAvRph2KfUyFiTDoNLKgF4WvbGk1X8s2vUgOwL8gZuLAk7ZsuKMT47B+GkCJouMi
         kNp/jMKSqYYc+BQfuURYiRQiajXACHs35wQ34oyP28xAFszAMFVVAObK5hYJiDR5JBN4
         fdUA==
X-Forwarded-Encrypted: i=1; AJvYcCVVKwzX5zzHzF1p4Ua9MGZSIQL2rvcfcHOWD4Ag4SyaThvGJ0AlFQPRMunUZ+761k64gp5DPAR6KkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5EwWS6DZPJ5z8rA1f/KU3WesUzMmC0uB87nU96dC183DIAIBr
	+h/73KWHsThG/8EsznpziWDn+enbgh9t444LoYaTMLoe1iJu/NniuNaG
X-Gm-Gg: ASbGnctLaAdryYXiVNIfCLSBo9enQgtGWS+lKBkW4LpzTJHUn2npNvWYUEjIMtzr+TL
	it0w04+C3zhg43J7O/tvDB/Nzb8XOATnVxIfudsX9X7N5U27gzalNlgbu6wmY+sjcSD7OMoOjyk
	V7rtmzc0qdEiYxNAFn1KZSxOSe6ytq++5ylcTlE5CusSaBs2h2MLvwM1SpPFCOhnelVO31RuagZ
	LmNFvsNOsFjC67GCYKL9BR2UlA4stEPfuN6vAyngXTOfiO8DmO1HNSgbFyChC6R9D2sYCB5siJL
	t1DQ+mdgkHt+NY+WT4ExA1IkM8kFwOkROap0jr/tCpRBrNbzkbdxn9SkxGLoTeGWw0LssI5wiVH
	vD0I5Ubd7tljrSgrM6zkYFf9dgfEDrfI+I1P5q0VXog77239fZSJ2Z5vDBzlHG1Cko/DL6X+zVs
	ny1TzbgLEdMZktEuYXEil6aLaq3gKsYVgzHcVIh1EAA80zDSFXHqGdW/PPBqoaX+p6KA6GeRMNi
	6054tG4w6ZAESMvoF38Q/Jinc3cpmLaixV1eKKEqzhrCJt0R9XioQA=
X-Google-Smtp-Source: AGHT+IELfcxDjkTjHjE9o1zeO9QJOYdqpFiv0rmTaYc64N3Xo1j3VaCkx7ujy498PmB8+3B+SyLiqw==
X-Received: by 2002:a17:902:e948:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2984ee01fb9mr30708195ad.42.1762946292125;
        Wed, 12 Nov 2025 03:18:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:11 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:51 +1000
Subject: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUejzpjy/vkkvernsg0f1VocNBsYcmoPfGGcYNvqp
 94524SxYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNXqRgz//d6GbizPvxkYE//8vkPl+4R5pvWLTsfJFmx87tjWwd0lx8jQpZzsKay
 ZNaeq6ohQs4Oau4P32Xf26tccFrxZZXi3cwY7AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.2


