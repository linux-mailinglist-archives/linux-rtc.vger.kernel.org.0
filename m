Return-Path: <linux-rtc+bounces-3679-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A4A74B11
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA7A179FB9
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4654C235C03;
	Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhmUU5BP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77BA1A0730
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168671; cv=none; b=hByzKUkqbHo0LQe8X9C4P9IC33D71eI4VYKuRW68zyObBlIP1WjbTyA4QnhXm6gE46ZqDRFNgD3VbqabiY5idl9wkhammqFV+6SWlDrd6MInPoM/iBpu52KeoYLCpz2QnF8/2rsgHmXZbmtRja0PQh54FjV/cDXWGPOEQDLVFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168671; c=relaxed/simple;
	bh=l1zcOTqbAXM+6Af1i6qiSSUmTQ2DiJduP75aVq1nYPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CC0U4+BkB9vWVSZvIbP781JDingR9cnflv1ERdEvUSev4iUU0o/ZoHXXRA+AG+QIIAHpIRNT/9CPfSdMreFdFFzmNrRu0d2ZC4XwpcPX0oHTKJ9gP5BVYCajlVYoe3Tgj2WvFF1kZn+5uPFimLGr4EjvqK5ckYZ1xWCSvngco9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhmUU5BP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so2732167a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=JhmUU5BPBvJeOyfDkeklAzkrzwVlKhvacXEhqq6HkJN6iZFC/69NkvY2fla2w4bGy0
         J5E1ItAYhwzZVEoX1BuKC2llkVduktlsJe2dWg0YGaSCZKjvDyq+DznybGtGcSafcPCm
         TLvCloNJ632tZq62eKfrOcozRt4tyavWo3rm3aMYupK0X66cRw5kwAzaqff/HUG/vvjn
         1vA+D6ywTG407kziUKNVcj4/tYYy6TANU234J2OJ+iFd5OzOPo559fOFi5CZNknLT0xk
         a8p5WoGdrOI+S9j+txpXDffYQZf2BkyvmA+D5JKoTfi9SB+msAoIRnL9VdkUr6lwy+aI
         koOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=CojR0bLdx981/UPMwt6gh1mFz3JHnCwEw+nve7A985vB9CsuiSFNoI2ia4eDl4sD1l
         o6a6VwiGtj/3y3Znw5Pljc03i/7QWlAeDpEdZRGXyRt9V0gA33U/9oj1jSaYfq5f16U9
         YVN/mr/Pd6QzE5d8uLvE06NKA/RijIElODbWj2RTL/J7y5jZCFDPvUI/s3rt+SGRwCsO
         yMlF3IXXS3HwMWsgc80aU98R6V3zTIkuuFMycoCTY9bOOe7Jpdlbpt6WeEBSo6XY1WoB
         YC4tb+tz7wUYhv5Vt9PG8iUGxaLay3U+H9xEoiF+t2hkZ+2QRv6j61tbQ+jGzPL3arzl
         04Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXWhyn9KaCNjuKlWscFzMTyMRjsUXMmYG0drtxjQnvQQI/tfhiMTUTvizvon+qIibXROWwgJqHJ3kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylAKdRhnWtPd0EyjsS/QAHapdve/6dqEYBTc35m/+Foa3lwlR/
	qP9GoAVVKR5gcTDprpqiVGMBMEtECGv8JWPKOQdPu/rw7TwUETK3Wi22k6fODKo=
X-Gm-Gg: ASbGnctFWNiEzD9d8I2ZYK4+V/dbUuQaLUgA+NndmsqvtN5vd+Fa1kJ2eQm8UPlPNg+
	O/9IWgz3mnmW8uWUBL5WpEMwe/2ta8N7DNfV52+iH+IcOLDX/uA2QBH/n9pgJNFkO5DQ9/GZ0N/
	k4PRuty9v8H45C93fTmxzJ0YCJEusOJ5Y76Jc1bTaZGe+qDpF58Dj/xWbsTkH29/8inNRkh1lkz
	ukffYpcjFnpmgxVwIsUuLktl7vPI7bCT4ZiHZZ6wj3VfQdc98rKbRCpME0IfGyreVxO0u4oFjll
	9a45dEnNUNyptzHsr1ZONMa+Owmk4PI120UZ2F5hczg1yGCiIYUXzcsRCEvksP+na1WwRE7JUi9
	Ekam5ydHSUT1NDOlMhuFLsxIArYrD
X-Google-Smtp-Source: AGHT+IHY77zJB2+ZvJcaGKZHiHxoVE2X4zdszR83ffWy9ORQ0cPQA29Aq9xL4S7dGRJozxmx6Qfd9w==
X-Received: by 2002:a05:6402:3554:b0:5ec:96a6:e1cd with SMTP id 4fb4d7f45d1cf-5ed8e061508mr6757044a12.2.1743168659356;
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:57 +0000
Subject: [PATCH v2 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-11-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog


