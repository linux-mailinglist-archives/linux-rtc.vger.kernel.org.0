Return-Path: <linux-rtc+bounces-4371-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DBAEA055
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 16:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71BD4188F5E8
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 14:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7112E975F;
	Thu, 26 Jun 2025 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Q+3XRwVv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7DC2E9EC0
	for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947524; cv=none; b=jAzc5uQU46unVZqxLV34AkITtQZJPRYTUVh7U0RaMpM3splqmAbpDgO9si3RULvHBPrNxYzH5j/SXjsOsLdSfAhsxeyzkFnWOkWfhWCU8YX/SC0rNcvpKTRn8k76Ac1Q1wq71dzWr08uJu+8WnMzQoR677TVatLyN/3fENFyZCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947524; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMkRHJ83P54qd5rbyBptVy6cmC//9ebBLiEFuaQzF7ouJg12QsMIhtkqAxEgouDRXq1ZdhGqqiv6KbmUmo50DjOmDN0YzgsZv/+QtDsYanayXtGbgLfe1fCg/uSqrZhoDhaYsOelYIH+VLFbtw0UnMoRXzADDzKN+aIUCUV66pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Q+3XRwVv; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a43d2d5569so14118871cf.0
        for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947521; x=1751552321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=Q+3XRwVvifso68eoSPHeTrETilw0BjmE6zi2Qgr/KWOQUOfH9aG8rg/HuSZHJXgHTd
         wyV3MDdwhbSxdKESYk30NvNVq5ESiXh4kuoYkbzInQu/6U2h0DOEAZFAmfYxbS4r1V69
         llhrmTlsZb/ptq1wZF8oMzyz3ddkoAmBNnYoIgTqOlq6qo4rD2mDnRfFBtjdFgtHWwjy
         R4ngaZkuoZ6AxQ/6MNoEuh7cPPDYXY6Mn37gn3iZAJH+3Gu6z/6MFl7zhks5WVswtPKD
         xqYzxbhl6DyP6gscEQvhNrXESret0poR9CJElypMtswv4w6+wwS5lojVE9PjLXlHPL4c
         3xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947521; x=1751552321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=JBLPAMz2dO/j4o+tbzRnkBdu0HdoTEM91kBxq9hD496xmxeWtC6wITd7BorCQiBmsw
         Q5pp2HnGHTBqKJNolKRB6c4vCDpPBbNqpqVKGuEQO6a57uadagb/ayVUAHjrxG6yyIeQ
         u5GWp8P8ytRhpvsBLQcgXUOo8KSAgBqiahNnbx7B71w+AmtYpwjWkpRuGnRRewgE2cnd
         zjJ4btZ9LXSg5gF0tcFmKURtKSJGyIW8cW0BLefWSPs66W9L3fFKnmfeCbPf09Bb2peH
         xluhUmOQe8RfHVOMl1zeLE9HuDeZjunyLxmbNyUy/OGsErsA1IA5Nuc8XBxiLXnt5jWs
         KTbw==
X-Forwarded-Encrypted: i=1; AJvYcCVHzEJrP1kPkzFOd+jDTBc38WraOiZoIlXMiaRwkQskndx9N2QEMbiyXYeZHZztMW4iU75LBDb+kPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmK65FgxXhzUWe9W40mFkG9Uhh44fYreY74FeN2A7vuk/Ue3C1
	mkXHs7QEUNt5VF0RtIhceReUo2zMKnsrI8xVOFocTN+oold6XiH+ua2yWJGH8/6mngI=
X-Gm-Gg: ASbGncuGlGtcUEKlOXA6oDvmGc+cmKQSD6cN6g/Z0JM86vljBA6DjFemvAkR/FAh0oZ
	O/E6DMfHNjSJfZq9ZKsZy0pzHJbEEBUCoCHq1JROj/IIdDVrfYuDvyRFsMAohwEgtJ4JTq3eMHg
	OmM1E5JLULVs7eJR9G1nFTe+vZXs8rn67KYtGvePvG5owMtklm1qoo5agvoHDdHpsEPl6GA1AD5
	1nZ/z+Tzctfgrc6hPxxp9WU0m34H800qL58oBP6DT688xZhWJ8BepROuDg5+xnuaiOLU/Ic4A+i
	R4WHGuOLw2bu7xDBSJJzA17I0DKq6LuStQ8D7ilW4gf2ixYxtinNoVHfm4nXs7xEjBM6DMhaboV
	hILmrwXFOzggVLa6FhbkFbUk0mpdkHizFVTE=
X-Google-Smtp-Source: AGHT+IHsx3U02C9l97yXNhErNtXWuqZBL2Ji63UbeBAH3WQ3eJzVVCOgX1IG2CL+5mxLNXJrr6vN/A==
X-Received: by 2002:a05:622a:13cb:b0:494:7a16:18e3 with SMTP id d75a77b69052e-4a7c07ca74cmr99997701cf.29.1750947521231;
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
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
Subject: [PATCH v5 6/7] riscv: dts: spacemit: define fixed regulators
Date: Thu, 26 Jun 2025 09:18:25 -0500
Message-ID: <20250626141827.1140403-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
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


