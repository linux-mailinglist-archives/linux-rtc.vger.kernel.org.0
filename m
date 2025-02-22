Return-Path: <linux-rtc+bounces-3248-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B336A40803
	for <lists+linux-rtc@lfdr.de>; Sat, 22 Feb 2025 12:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20F57028D9
	for <lists+linux-rtc@lfdr.de>; Sat, 22 Feb 2025 11:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463AF20AF7C;
	Sat, 22 Feb 2025 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1whvBpF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE920ADC7
	for <linux-rtc@vger.kernel.org>; Sat, 22 Feb 2025 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740224516; cv=none; b=m+/S46wiOKB0DSAUr5K+t66QFTZpc7PyhZJqNaY4msOg6WIcu4zbPXVTcmEqp2l/YBx7H1/u6IczlLRqWSvg5fD4uXbnlU3zoqEODRs/6V4GeGPyogCf7eZmZRgQGvdF9uv5lYh63u6HFTB1hFxFq9ke5XJo682SPdcP3bOZdOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740224516; c=relaxed/simple;
	bh=MlzLoJn0hI4TnuOde5+xu8VG/g5LzpLWIDWX+sOucWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCKpR+75Koj+ARAqr+LbEQ2odwp7ZJExardTdTvZakTb1L86ylMmhrvVSeid1fC/WjqtV7CsXqMnwwQnASMRN5edkRUKYVtZ2x7U/TCkfK1/0IHzzh7dTtwsFAwHRdRZFpDGgmVX6+pVgUUWqqTDZX/OsOR1+zAzcPZMVmBA1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1whvBpF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso536806a12.2
        for <linux-rtc@vger.kernel.org>; Sat, 22 Feb 2025 03:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740224512; x=1740829312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNjfWzQZO+4PAOyGjW6OluToh2XJFJIsJj/h61r4mUk=;
        b=g1whvBpFuaUVYYkGSAsVt33qU03lMYI6DVekCuSHQ5Wa0gaZ7O3W3ygY3ibK8lhUK8
         inqnuvoekYKJh8Mfhlx0bYF9Yo7aOo4bOA0zhIWneruiH7Gp56gjHK6+DhSClPrcuPP1
         3hOumiDF+nRT1v4vfY4XilR6lTkuY5Axw4FT4GY5+eyfoTvFF915UCoC051/igj5urHv
         +NyHtEuL5O0WKN3DdtV1+4UeRCPObWRuXTB7OO9kowttysz8uCDWK9rtDdnt+BVOphTF
         qwhfYIXSE2ycnzIZMaEQ1YA8KP2L3Uelt+/yskU4fSTjfCHiwOdW6j5z6+/vvJgJGmYu
         fsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224512; x=1740829312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNjfWzQZO+4PAOyGjW6OluToh2XJFJIsJj/h61r4mUk=;
        b=VOSvPaF7MxmsBfYJuA3q8A8h9z5pT1iFwaxsI5DLu6WEKqrCI5Ic6za5mXV7mNnvaq
         z/MrjNqM27rZU4wlWlMmzFlTs/GxkmBgDywZx4+AkEv7SnomhFglAvwdMXJk0qFue7GO
         hylewWXKc89st3Q23RuoVlu9A63wWTdpd6zazblCec2e95WMCHdvgedRraA0vJdh6F++
         Nu/urlzCM4dV6OBcQKj+6iZh/rrj5tdiWS6sPykesTjcRykgF039LPp/iRhOWYdQ2FPs
         oQzbkDSfaUDft3Lcf9QDaLHIY2RclRwUPGPqnDVEsSU1DhQGTKHGvv2yI8PUK37dp7LA
         K4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7d3yB8dAsCTXuTvkEgbs+VQUY9ACAfQTy7J4xgAsgPs5exfAeYt4gdTv9eYIiGdxxyBLKQdO+mf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/srhfgX0Mv7CfALXiw0H2hA0K9NLZJLDDPoQNWUgoUtgOjhG
	5LepmEWi6nMk5dMwcoMMLcx6/xGm/m8cZ+sp1LxyaMvvDB0kCy23RhRIFe1gYLM=
X-Gm-Gg: ASbGnctLhuW0QvFjzZVKjQNQ5aWEKqy91COstv+3mMEe5413dZURO5vLCuQtGLb0n8p
	+xszEMGsJ80emM1bpixIGDxJ9QWEXzlPa8TwD43SeTMSDdqUzwNaESkxWYTPQij1Ao2jImjwkpz
	1S1Nc8kF7FiCBMRl3Dl+yxrtyDsV9esUu0urEs850toDu37QX1kaGD8Cbvwx3q23xujbFqxAm2J
	JpVa3B6ua9uCKQfI+qg6Xogqi+hUQjOBvq+i6PY/Vz+lrnAz/gfZhVL7FfUTrvzQ60Cq81DxP1d
	rpDZS8WnWd5KiUQMRLVp7tNOZiuF4YbBc0X4tohTllxjnNIBNyWI+syqv4KSnhM4IXVq9vqHh/I
	=
X-Google-Smtp-Source: AGHT+IFcQvTgkA1f2hC6rhrOt+z8Rgj5dYf0GvHomaCCODgthYe9l7spIG6OTlB1RUvFoiqx9sQzmg==
X-Received: by 2002:a17:906:4fd5:b0:ab7:82a7:bb1f with SMTP id a640c23a62f3a-abc09bed0bbmr266509166b.10.1740224511727;
        Sat, 22 Feb 2025 03:41:51 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5337634bsm1852663066b.91.2025.02.22.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:41:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] rtc: pl030: Constify amba_id table
Date: Sat, 22 Feb 2025 12:41:46 +0100
Message-ID: <20250222114146.162835-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250222114146.162835-1-krzysztof.kozlowski@linaro.org>
References: <20250222114146.162835-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct amba_id' table is not modified so can be changed to const for
more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-pl030.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
index 39038c0754ee..1326f310bf93 100644
--- a/drivers/rtc/rtc-pl030.c
+++ b/drivers/rtc/rtc-pl030.c
@@ -148,7 +148,7 @@ static void pl030_remove(struct amba_device *dev)
 	amba_release_regions(dev);
 }
 
-static struct amba_id pl030_ids[] = {
+static const struct amba_id pl030_ids[] = {
 	{
 		.id	= 0x00041030,
 		.mask	= 0x000fffff,
-- 
2.43.0


