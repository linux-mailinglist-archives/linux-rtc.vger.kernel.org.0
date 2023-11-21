Return-Path: <linux-rtc+bounces-337-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9397F2937
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 10:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE5D282813
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 09:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C793C07E;
	Tue, 21 Nov 2023 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilDL3Noe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAC4123;
	Tue, 21 Nov 2023 01:46:58 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ce5e65ba37so27680095ad.1;
        Tue, 21 Nov 2023 01:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700560017; x=1701164817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCAV9pEXZft0HS/dcoIHi8BP6UZFgoqvZCUuzN8un3k=;
        b=ilDL3NoeQeHCe7CgIdO+3mjd+SoQY+G2vpGtLKcZ0lRIvj5TTWFmvgOOgDgq/0y+B+
         7bs75TJAb9AUeER5kMmhsSrKiNgD0hIjVK9l+y1SXdF0tQT/Esg7I6+CILJAicBIVi/o
         oP1eh9l60/fLwRnTqjguMCU7frEBlSBOLBQ0RabK8R3Ts3iUQCwK3080JlaNLSeUFNBX
         oWMI6bvuONxqNvyI5duRAaYWDu6oz6JFZKUnzLGAkaxbjxgzpOcH2pwyCl2xkkM9E/Lm
         I9/Mtfq7miDHzSZK1ihhYUmie31xeorTsGCbULJfHoCl+rvEyDbaogRxsLf5WHCzSRm7
         kxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560017; x=1701164817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCAV9pEXZft0HS/dcoIHi8BP6UZFgoqvZCUuzN8un3k=;
        b=EGIpB2jeiI4TjLqqIAENXFbfWO0NkGactE1ye68ckVQqkC8GMKnv8sKm35deapP9y4
         e9UJ4+ARij8aWMZ3TSeh74HckBajFw4U1JTzO6PgshMiXJn5lZPrjQ/cYgF4v1kl6eJ3
         TZG+MF4ZDtAv9lz/fWLCKUENOsWW3A0H79QhCLVRR/Wk0pmx7an9jWiJ0NuLD7S2I1q9
         awRkoFNHUvhBVcrBBVWgRwDp8340FHax2OlJO20uWmvknElumCYRVKs+Bxu/cfruSM1e
         yb06mx3T6ZgREHIwaYy/3DE7njsnSoC6XSVu0Iacxat5ibDjCdscTgjQX0A5EqydMG+A
         WH/A==
X-Gm-Message-State: AOJu0YznzSSdwVoxlFDvcaQRR5dRKQpEKzeccovhkPmeloneUGeJDp1M
	/IkZG1OTkIuMXZPIBFaxzws=
X-Google-Smtp-Source: AGHT+IHdlkUMhUFMpTle56kIPqsDsXlE8rVKVKTjUSo8AGRFTrVPH41FJYsCpu8Ml6FZNJsPfC9DmA==
X-Received: by 2002:a17:903:246:b0:1cc:6078:52ff with SMTP id j6-20020a170903024600b001cc607852ffmr2689886plh.26.1700560017496;
        Tue, 21 Nov 2023 01:46:57 -0800 (PST)
Received: from localhost ([2404:7ac0:4d26:224f:5ec1:6805:f429:17ba])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902b28100b001cf567252besm4903538plr.237.2023.11.21.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:46:57 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: add rtc dt node for CV1800B
Date: Tue, 21 Nov 2023 17:46:42 +0800
Message-Id: <20231121094642.2973795-4-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
References: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the rtc device tree node to CV1800B SoC.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index df40e87ee063..89411c75b89a 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -119,5 +119,13 @@ clint: timer@74000000 {
 			reg = <0x74000000 0x10000>;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
+
+		rtc: rtc-controller@05026000 {
+			compatible = "sophgo,cv800b-rtc";
+			reg = <0x05026000 0x1000>;
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&plic>;
+			clocks = <&osc>;
+		};
 	};
 };
-- 
2.25.1


