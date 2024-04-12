Return-Path: <linux-rtc+bounces-1020-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0EE8A28C3
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 10:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1A7128A9CB
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 08:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDE3535D9;
	Fri, 12 Apr 2024 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JqKrykWH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440104E1D5
	for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908998; cv=none; b=jCUX2RVmKXTVUTBALhsQCatwtQXURKUFsLF5s1OetRAWTqNtavvTfZwJSS9LB0aEuTaqp0JFg1NYONI+NP2iD2/VCsbfDeQ2u8OgcQUS/Ub0FHfQpHXQkQEbc0nRuGRt+MVRAZjTk4ToW/OW0JPCqO8St7KS5wlUnaUopc21Qwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908998; c=relaxed/simple;
	bh=7c1RQocUPxtNkMUYrXuz6Z5XrMBoGDR/AzBjy6t0JNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEL5EwPU6IWVmSthEtog8iaiOSGFvUOys1O50AoPTTLCpcdxCb7m1ttnTvbX7YZQXSFOZmPnX22Q1HzPB/zaRdlulmss92uLPzSq7OcqCdsA0EgvcC5XeSfDBf6HRJj/+3Z6fyDrE+BiGgnL2hqjWSfQUcCqmFu2IHAmQwfu6dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JqKrykWH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNPGi/LJLZ1f/UWkNAkdI7gt1aIfJVZxqk0hEY+zuuE=;
	b=JqKrykWHQV73GDXbXVySu2Zbz75YyXxDEs2oqWqtr2/NYmuNuWdAJNTvixECeE1ZMR+6Sv
	zg675akts7a5or1YYkmecARaghM3JIoARcsdbZXd0tlczcNkehFxCevMoQWTsNSjpYU537
	YzHluSR7Dzxs59DjXlFOqD5FZC3FhAA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-KlElY9aSOdqqZuQTcjCI8Q-1; Fri, 12 Apr 2024 04:03:08 -0400
X-MC-Unique: KlElY9aSOdqqZuQTcjCI8Q-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2a2fe3c35a1so641079a91.0
        for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 01:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908988; x=1713513788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNPGi/LJLZ1f/UWkNAkdI7gt1aIfJVZxqk0hEY+zuuE=;
        b=m4D3ppd9bRAwsV7xKZo4ZjFC9Xvvgw/TZw3e85sISWzttjHYRBEwU9Vqa/Lh+Vbzz5
         Vn/6ZhsnqayXje5UUdMriCsdqSFWz3wdO+PYPxNaQGmi5KbRVby4YAHOKTSTiullZXXK
         3ZIFIfB07eJKVbNwxjHnXxLlyTKfPf99AFMaF5SoS3BLfr9lr6xH0MgC8f84r8p1hcVM
         Y6mSv6VreBv1mFbJiNgy1Uahoy+t/XJlmRHY7Ot+Jpb/1t4Ww6dQ2rbPWYklHXyy5MQc
         CdSyC5ML9nQuR4MWbP4phRaZX2tjh33GnE3uwNZ9U5tRC2t7YXJMm0d9QZrgbr+Fxd3u
         eJXA==
X-Forwarded-Encrypted: i=1; AJvYcCV3dFFYHUlkZyQjnst0hPEC6zpTyS4cDwqDZ+woZ+H+RFmqJ6xBWoMCtHzukHqdqfD9eabyYn9vhdp6JcHHs+o0z6IRwTC4DLqP
X-Gm-Message-State: AOJu0YwOmIiI4RUnL7b5/CZNNkFsX/zYsvVmej6vX3PCtKE9cTv2smgY
	WHHkL/6aG2JeUEHQMDjR7Ey6r8yUsxTeveaedbK7N/e+DzxmVZxz3Xm9OGDwh56rfgRMUeenQU+
	EepQwOrc2lfjI2Vb5qpy7IgyHfMfQh2l9qSWfpnGZl2MQVpTqCUFfLJJqgw==
X-Received: by 2002:a17:90b:3597:b0:2a5:5334:e223 with SMTP id mm23-20020a17090b359700b002a55334e223mr1616955pjb.24.1712908987666;
        Fri, 12 Apr 2024 01:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEXR+HX46H9j17BcJJXoxM6E1KRCiVCkfSB10IGeNquAnS6am5GYCSSbFBeb4H+vygzWBIgQ==
X-Received: by 2002:a17:90b:3597:b0:2a5:5334:e223 with SMTP id mm23-20020a17090b359700b002a55334e223mr1616944pjb.24.1712908987375;
        Fri, 12 Apr 2024 01:03:07 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:03:07 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 5/5] riscv: dts: thead: Add XuanTie TH1520 RTC device node
Date: Fri, 12 Apr 2024 16:01:47 +0800
Message-ID: <20240412080238.134191-6-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412080238.134191-1-wefu@redhat.com>
References: <20240412080238.134191-1-wefu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Fu <wefu@redhat.com>

Add nodes for the XuanTie TH1520 RTC device node on the XuanTie TH1520 Soc.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index cd6bc89a240c..62e588dbc942 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -463,6 +463,17 @@ timer7: timer@ffffc3303c {
 			status = "disabled";
 		};
 
+		rtc: rtc@fffff40000 {
+			compatible = "snps,dw-apb-rtc";
+			reg = <0xff 0xfff40000 0x0 0x1000>;
+			interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc_32k>;
+			clock-names = "osc_32k";
+			wakeup-source;
+			prescaler = <0x8000>;
+			status = "okay";
+		};
+
 		gpio@fffff41000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff41000 0x0 0x1000>;
-- 
2.44.0


