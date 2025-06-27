Return-Path: <linux-rtc+bounces-4392-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031AAEB9C4
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 16:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAB571891829
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CD32E542A;
	Fri, 27 Jun 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vyOnL0Sc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393302E4263
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034205; cv=none; b=FGCup8otWt1tGemDlhYhJEmBo7TTYRoNKKucee9sibADI1qGnnVXG0SgpnY6867NDc8M8nWHIXzQwKulaSuwOGZaqyKKeV++BZbsfR+ouYBQ2rthNTsL5GL2xkuUc/cgmerDJBtYRU3w10AtP8na72fAOd51uXzhDZHrFf60ECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034205; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ju4cUJxOJTf9tmXsWUAVYwGvCHJoDTPA8xHJiwrRK9jwvdkKKeh6pSFP5oeJQ9vHlOJpxhKwePHeziJ4JJyziMkSG0lKbGZqnFgEDVTw46U9pQIoV8L+ry5DOug4cICkXw6W6ynoSQLKyQWcCGOYDYeVBYQSm5h7/hVfwFixdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vyOnL0Sc; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d094ef02e5so365141885a.1
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034203; x=1751639003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=vyOnL0ScpdHDCvKl57jCczsekDM9IM1QoaW+iyOJlWxRzrOUhBr16IPASxwBTGflyK
         ted2mCV9+ImgzVD0BxXBqjybykmqTYUytYVaDqUjhoUBVi72v9x0ts7BS/Fydg69C75X
         MT2btvkVIY/0Esfgz83iESJo/GJNNvTNdDMz3sdSLAbc0P9tdUG6Kp5sSJ2RNaF770Ct
         TBSeNMnsMELfSFM36W72FIY1L+glqtZbB5lpeYN0aARIWETa/nLY9Rvhi5ISTOSgV0Xw
         WZYlgzRgHQIFLQIK4mOfWQbWQ/cWvKayh8jxVAImPWeJ8o6D9fFH9q0XfVGNyK4cG1e7
         YKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034203; x=1751639003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=Kd8BJIYyDLSmj46UsBxXXEJTazwZs5ebMdumYC3aSR67jNWQBEgVbpEMP186sYnqjg
         1BjCfToFN0/s2rcP0yQlvNTmkOPd05ulvcJ5v6S4/3bcKSdwl2n2GmLG/ZCYXpyT0Jhc
         hCMCVMHeoQkQX/WsUtw8ABzWuSCou/nRM83SIsWR4U7IzaBw9yw/WYp5KD4d5zRQZfYy
         M5Z6mUVVKj33OraCabCIDYa1Itw23fjcEf7gIkPSEcwaty8ddJvHx32L98DBTB7S+EUM
         quMmFZhZ75No4bw8tImZXEwkvn/u+Ra/zf3uNyGDwpHvoPQRhP9PpMqZ9oD7dz1A0bBs
         OMzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ISJJVlkH+xbKpvelvFPXbfzYLNz4LS0aGjSnZOSV9Qfwo45XBsmKmYko1UF6UPSXw+5Zy1k5EYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZDLmxjvW3IeZUmvMmKi9w72YftWm3stt4TR9jryAdtkiWPXI
	c8MjX/F+9JvilATKfNk7HAhS3+jHQvVlK06CCvyziGU88WD1Lk5xpGYA5xKxwLTIcg8=
X-Gm-Gg: ASbGnctzR71bUvCtHh/DC3ta0u9DiF9mjTNiUGS9DCMFtORJeH4S9NEKvIlef3F5V5r
	LIuFcDHPWWq8Jbz7Uydk+x+E/1dzctUcxi0txB796h2X1qt6yGRLTNGViAQ1M13Zm16j9l8Mkn2
	6jSPjAy5WSvk5DERfHAFNFI3f84EXPSQD1hLbmXBW5spVlj8kLSENvxShtpSpdnHmBa8DBY/MAb
	HNTqXodUxMTtbwetcsBHKW1n07XqHFByfUn/kr2Pbwgy1m/jIAS6lAMt5Zx7bdLRfQPEF9TyKv5
	Z9jkG3hi96eCWdasLW7S4ng8kXguz4kFnD4hvCD5fM2s3/jlT/c9Pu/5RuhrDehywafIuo9FOKj
	HrahJLoTr8hyIHR1SHJj/Kn8tp5FZwve2HKo=
X-Google-Smtp-Source: AGHT+IE88bXOLiCjUu2+zVcecKfJf8g4CQ5BFAJMyhK2OHk7mseb/EKQgLzh833iCYXdtJd2+G7LJg==
X-Received: by 2002:a05:620a:2729:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d43bc15837mr1028658485a.24.1751034202759;
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] riscv: dts: spacemit: define fixed regulators
Date: Fri, 27 Jun 2025 09:23:06 -0500
Message-ID: <20250627142309.1444135-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2


