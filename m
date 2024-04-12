Return-Path: <linux-rtc+bounces-1015-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8F8A28AB
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 10:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D37D61C222A6
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 08:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A5A50277;
	Fri, 12 Apr 2024 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W5UiR/xZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CBA4BAA6
	for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908971; cv=none; b=qgtSLAZAJ8CJdr0hPMfqaSyWV2H1p3yIm73eIoT24KXbRGlVtWrRYdkdYOXoVWTC21qPLRZJ3z1su6/vzMHREanlDtGu1fXqjFZyzR48p/L0p4406Acl59zT4S+gQT2f8xLe14/3Kcs9Dm4VavDvIqd8xOM8H3REzNrFqgfkm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908971; c=relaxed/simple;
	bh=uSijoLi8d3vfXjAlGsR0KQFQF4ugS0o0mh5TrBrRpeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZc0sd3z43BKkgb846hy40eMqPxlboNcNoC5a8FlLN3efelZrqdgi3lFtVp63LHqVBp6VthWjIUiPRuGnDn/Th8jtX4zL+Mbtt5StUSU2d4pq52/KsIc8MtFJ6dIPPPcYGUrEk2moTRHiOWEFMXtLHq6tb0jR1+5lEQLJCh2dIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W5UiR/xZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k7/OapXEM9hlZWA7yCBRs/93mN3l17NGNZqV6UA5j9E=;
	b=W5UiR/xZlLtCachcXNO69WP2ocePekWFlSoOL7lOWpuJDFjZuhV+4DLGw4PN9u5ItS1DQ7
	/RuiLVeWGwfc1+HImPI7Hu0tIQg81driuvsbLmLmfmvodj9zduvgO7vRKe7RBWa22EAT0P
	JfPTw6wMsHHJN8Y1PF9UjmG8NoFf5SQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-aFxrxoxKPEarwxdiFFMTSQ-1; Fri, 12 Apr 2024 04:02:47 -0400
X-MC-Unique: aFxrxoxKPEarwxdiFFMTSQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a53909676fso624646a91.3
        for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 01:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908966; x=1713513766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7/OapXEM9hlZWA7yCBRs/93mN3l17NGNZqV6UA5j9E=;
        b=oPsNhTjQdRPWxljE7OPWRMlOoJjE3pfZXBHr8/32uklySQSDqm/VDWtS98LK3rvpEv
         XA4t1nEiW8xFGYXbn1ThRxzi1/w9yBlAbNGZdMMsWQ6+R8XVsZ1sPxBYWgRgMOYALXou
         6H5lyRlflB9n4OCDRauhPt/TdXYh/waonE7kRQkpyLiQD5GwjNMCud1vyLpkZ5VZFd8S
         9ViS2T/ugmD5Fl79NFK44bhZ4aIUx1Qw8Js6KQ7kqJ8V/yYaNO9VbecI8hRLqXRpZvDQ
         pBu+UCycA1q+S0+Zk6hjle3GdrKYG3vaPXF77oaWNT/0OGpwK20ZFAK4Lj3q3c4B/jO1
         09Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWGob88owitdUUsKAnK9HL5se4VrLNORmdlYEF9FGJ5eDA4UP3GkBxOhcWgcOuBvR18cpt5h3ENDUxXwp6ZG7h8yUcVb/bxXb7b
X-Gm-Message-State: AOJu0YwmoN/v7RlSPKzeOSFTU2ypRVS7IKb2Uc52EUFasJ4YQNgiFovI
	h2vnWpVJLFuH0w2VBeikZkEKLHAUZw1sKM/8aT8pi3dzElNCvmjcmg6uUtq2/rGhSRbkOijme+6
	jJ8DCkW9ancyJxdRvXhBNfYCLTTaEezy+ftOIUaBxbjve7b57VtdIrR/vHg==
X-Received: by 2002:a17:90a:e501:b0:2a2:616b:f3b0 with SMTP id t1-20020a17090ae50100b002a2616bf3b0mr1913801pjy.35.1712908966016;
        Fri, 12 Apr 2024 01:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSc4T0+QC9jHg1hidzbPxP03+A7jHsSw9GJe34xPb1pjDLvNStx2JhXJsXAeuWkfAFN1B3Zw==
X-Received: by 2002:a17:90a:e501:b0:2a2:616b:f3b0 with SMTP id t1-20020a17090ae50100b002a2616bf3b0mr1913709pjy.35.1712908965676;
        Fri, 12 Apr 2024 01:02:45 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:02:45 -0700 (PDT)
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
Subject: [PATCH 0/5] RTC: update APM X-Gene RTC driver by adding the pre-scaler support 
Date: Fri, 12 Apr 2024 16:01:42 +0800
Message-ID: <20240412080238.134191-1-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Fu <wefu@redhat.com>

This patch add Counter Prescaler support in APM X-Gene RTC driver by
getting prescaler (Optional) property value from dtb. 

This hardware support can only be found in DW_apb_rtc after v2.06a.

And adds the optional property "prescaler" in bindings for APM X-Gene RTC.
Because the clock source on some platform to RTC is NOT 1HZ,
so we need to prescale the clock to make the input clock become 1HZ,
like (32K/prescaler) = 1HZ on the XuanTie TH1520 AP sub-system RTC.

This patch also add "snps,dw-apb-rtc" into the "compatible".

Since XuanTie TH1520 is using the same RTC, so this patch enables 
APM X-Gene RTC driver for XuanTie TH1520, and add a device node in 
the XuanTie TH1520 Soc dts: th1520.dtsi.

Wei Fu (5):
  drivers/rtc/rtc-xgene: Add prescaler support in APM X-Gene RTC driver
  dt-bindings: rtc: Add optional property "prescaler" in APM X-Gene RTC
    Document
  drivers/rtc/rtc-xgene: Add "snps,dw-apb-rtc" into the "compatible"
  Kconfig: Enable APM X-Gene RTC for XuanTie TH1520
  riscv: dts: thead: Add XuanTie TH1520 RTC device node

 .../devicetree/bindings/rtc/xgene-rtc.txt     | 16 ++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 11 +++++++
 drivers/rtc/Kconfig                           | 12 ++++++-
 drivers/rtc/rtc-xgene.c                       | 32 +++++++++++++++++++
 4 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.44.0


