Return-Path: <linux-rtc+bounces-1017-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC58A28B4
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 10:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 627D6B25058
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 08:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C214D502B7;
	Fri, 12 Apr 2024 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPMWlB2X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD64502AF
	for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908979; cv=none; b=cGLgndnA8+49+3Ijlg+6li9s0xVfVhUENNMMSAzfkH9j/kuWRrL0v5iAm7lGf/h7nCXfVHYKx0gmjI/pPy59KQ5UMYqwEsnCXZLG1jBFGEpgA5J+AR8hVkGz1p79z7uF8MXy5tXrw/T++YteM8cpss7uEXrR/oX9+4RWfTkhPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908979; c=relaxed/simple;
	bh=JTnQIL4uVf1d+U1PUuWLR8evmD2VdRFbMvusYS8IOTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MH7KXgab3GiV2ElbvUmA/d8WChAFKaHXKd7jV1Fd7laByH4KwUJSA3S5IOrF/h0IpNuQq0FwXP4+6GtZVx9KXAtFG1TSmcP6+kxqsY2WBB4ljLtFOzCqzYRrOkKnyZ5owoewd9MaKgFRpgJ4MR94t9cGFLAOhEB4owVAakx2/Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPMWlB2X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yKfHvWoABRl5sMyudqLBw3GDuqqgdkusDwKI6CPTPQ=;
	b=SPMWlB2XroDNAy0Ogc9XXNmXynpCNa2uehDqY4TGEEup+bEg+i5E6BwDKGHzQoEhhZ4v7m
	PxZ7I3hqELENk/Oas9umeRVtrFmgrK1O3CkXIyKB49tUkJpPwPmA3SjyGbiIREzhSIpa5j
	TrgVnSwvZgABkysKqDydJAgm95pPKPI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-QSs7DCBHMV-B7VrPwlf6NQ-1; Fri, 12 Apr 2024 04:02:56 -0400
X-MC-Unique: QSs7DCBHMV-B7VrPwlf6NQ-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5d396a57ea5so498665a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 01:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908974; x=1713513774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yKfHvWoABRl5sMyudqLBw3GDuqqgdkusDwKI6CPTPQ=;
        b=AT5UgbghlYtxvpc7NCTx00UQSupanXufT+4Jyl8hca1YfVNvy4UEd/tl1xPo4To53V
         tBOb/VGAIxhe5NjTp5gD4Ep/vxY+k0XzfJZB/55rtVcVhUv0Pg2Lc7b+l5UaMqCPVD7Y
         JzhZAhwFvRoBuAV1AJCR+eSKV8jPuqmjRlZrP/onOZkMgNHPUcKPmCDtdYCfTsap9v3d
         j1tDlaqxYNIEWkvDCb0YY3qxiO90tQWMIf/ueo+ph123B27sinNTEcga6X2rK1Zfy/Bt
         +ngDYWib9kQME7uW5wXptakq//+Dt2yOkuHEukeUqUi0/Xa2hIzu8c0iMu/THOLjQ9ks
         IGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPsvvDP9XkOQ3v9+Fzk8TJXFMBl4j6SAtvVsI6L/yZ5CwyJCbsxu6TSvmPZKZXTIBNeGki7pjEPIzyDx01FCPnMs23v8Pwi7UU
X-Gm-Message-State: AOJu0YzZjn1y76HITO1Za9q5dyXag0WcDD7niNM8QPtpW/ps/jlK8ka/
	0nDcmfHB6rYkmAj5jtST6eQ/8WX+dj2iQiv31P3jdo310B9qOMSwrQ2uKbOyax2d0J38eNY4Ryn
	TuFBexdmtkS6u3QPUlPq/MRbAx4Pehx7Bb7EHnBkFo+lZDhRxZkwQjA25yw==
X-Received: by 2002:a05:6a20:b2a0:b0:1a8:f807:a683 with SMTP id ei32-20020a056a20b2a000b001a8f807a683mr1742251pzb.60.1712908974688;
        Fri, 12 Apr 2024 01:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIyJtX0wgUO4lmH74Sd9uNUsfNyAttTAHPN/Xd+GfCO9uPzni84bxgj709jf0ECV6wA4qcFQ==
X-Received: by 2002:a05:6a20:b2a0:b0:1a8:f807:a683 with SMTP id ei32-20020a056a20b2a000b001a8f807a683mr1742233pzb.60.1712908974342;
        Fri, 12 Apr 2024 01:02:54 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:02:54 -0700 (PDT)
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
Subject: [PATCH 2/5] dt-bindings: rtc: Add optional property "prescaler" in APM X-Gene RTC Document
Date: Fri, 12 Apr 2024 16:01:44 +0800
Message-ID: <20240412080238.134191-3-wefu@redhat.com>
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

Add optional property "prescaler" for APM X-Gene RTC.
The clock source on some platform to RTC is NOT 1HZ,
so we need to prescale the clock to make the input clock become 1HZ,
like (32K/prescaler) = 1HZ on the XuanTie TH1520 AP sub-system RTC.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 .../devicetree/bindings/rtc/xgene-rtc.txt        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
index fd195c358446..25ba8cf0cc31 100644
--- a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
@@ -10,6 +10,9 @@ Required properties:
 - #clock-cells: Should be 1.
 - clocks: Reference to the clock entry.
 
+Optional properties:
+- prescaler: Reference to the Value of Counter Prescaler.
+
 Example:
 
 rtcclk: rtcclk {
@@ -26,3 +29,16 @@ rtc: rtc@10510000 {
 	#clock-cells = <1>;
 	clocks = <&rtcclk 0>;
 };
+
+Example XuanTie TH1520 RTC node with Counter Prescaler(prescaler):
+
+rtc: rtc@fffff40000 {
+	compatible = "snps,dw-apb-rtc";
+	reg = <0xff 0xfff40000 0x0 0x1000>;
+	interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&osc_32k>;
+	clock-names = "osc_32k";
+	wakeup-source;
+	prescaler = <0x8000>;
+	status = "okay";
+};
-- 
2.44.0


