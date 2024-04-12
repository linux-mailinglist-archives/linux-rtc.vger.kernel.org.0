Return-Path: <linux-rtc+bounces-1019-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAC78A28BE
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 10:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7183B25764
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 08:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C7C524DF;
	Fri, 12 Apr 2024 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WVL9qUmG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BA7524B4
	for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908990; cv=none; b=bpZ9EDCMBV+5Jsc8ZB5XfpdiqtfoUGTWkKIF05YElvTlNXOQl4Q0z4m9j12Uqc8O762URUQz/aa9xLVeStfI/syslaRATtfsFTx+CF117XX0+kKOr1DsHktV3c7Y/6D4pamSWSLRwruGc/lfWKZWAXBUYFjv0C8mPxzQ78GhOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908990; c=relaxed/simple;
	bh=gTnC52BuFuHklvm77ihUpKGOwdcbvc5JJ4SAx0eGNp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5vKvBZ/Pgv+bqrTcKGYerMvc7v0YAMJ/W4ZxndbpOLxmDWITeGGutI8gw7F21b7Ja0t0e2cyWqLHdIIwpsbjfVUpJpnsEz3wdYBD8DAxe2On4KkvnimAdMYnAwPJ/8lOEGgriy2epVUPkuvKWQK2g7LxFxP5wixfqCBabP6964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WVL9qUmG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imYSfgUV9tShp4d1ydGnn8vza1QDI3KMYtf8eE+SzCg=;
	b=WVL9qUmGgKILQEwKudG6375IUfAbArcRy8byz6sNTtzFD9gVWWbH4Nvqo+ePxRIfIojm5x
	PZr25jYg/eqUljVXmUDOKRwRyo+LNrqNqPcvMVTeeUWzpP0WtLIhpZHB/nLRAGFPJy1Fpx
	aBJ1pq/r+hqNFmMgm4ezsCgSx/FV+GI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-uzxOlYF3MvakGa9HPeCXDw-1; Fri, 12 Apr 2024 04:03:04 -0400
X-MC-Unique: uzxOlYF3MvakGa9HPeCXDw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2a47006e272so638786a91.1
        for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 01:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908983; x=1713513783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imYSfgUV9tShp4d1ydGnn8vza1QDI3KMYtf8eE+SzCg=;
        b=kfx5AtlLz7Dt5zYlQwGeeq9YRO3X8jpTI0xDEfsAtQ7foeGpAZzIZQcoxSWUtM6diy
         yw9StimXvubb1Bwey2gM24J3cqFmy/60FdSU9I2r/btbhP58GJFLKCEffuBQNrWMaROf
         Jc4Ll7p6Y4Yy4K2m27++tUQDAx8ymYOhlCWAQsCbZwVeVGk5VS37Td3uEZDq+7RBDLok
         XS69M/GLAseu6W9u2YI8+Kt1rBTycnnEOPoLF8qqSp19tbc7QuRg0dXW0rvCPSnUxnBP
         dv7F8jstPgB796OCQa54TV3kofKlP5G0P4EW0n2d3kIy8xATOrxji3cWhkwUhuFlvdzF
         nj4g==
X-Forwarded-Encrypted: i=1; AJvYcCWAM/qFqtbE7SVGOtznWnS7KdeqwfeFZhwhRosRXEf9UGwHH+buPEAWf0Vvuyn0novs0OKr+ubHYZETmnq2x400RMHyIyf6M9yR
X-Gm-Message-State: AOJu0YwChO0Is1XbO9hZ0FFFmlDzN6zNb7njbYJZbF2hBlhcSufETMNP
	I+wOX50LB/H2hM8Kzklraz+V0oQc9yLsbiNxjDIKUpWvGWx/fuiqQm/bP2rLzlegLIAuaQFRs2U
	fsokXCFngt/Cj79KNUvdcFDUlUELil0JuCU4HoqLp0E5R8v3uA0oVzuFwBw==
X-Received: by 2002:a17:90b:3149:b0:2a5:2ef2:4ce4 with SMTP id ip9-20020a17090b314900b002a52ef24ce4mr1583954pjb.41.1712908983316;
        Fri, 12 Apr 2024 01:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgFOZohr24G1rXc3Bo3/PYBVjDbfNE4fUPuj6ECJPGPkq7S6KSCCxgCSovuRZVguBmCNTFpw==
X-Received: by 2002:a17:90b:3149:b0:2a5:2ef2:4ce4 with SMTP id ip9-20020a17090b314900b002a52ef24ce4mr1583940pjb.41.1712908983043;
        Fri, 12 Apr 2024 01:03:03 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:03:02 -0700 (PDT)
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
Subject: [PATCH 4/5] Kconfig: Enable APM X-Gene RTC for XuanTie TH1520
Date: Fri, 12 Apr 2024 16:01:46 +0800
Message-ID: <20240412080238.134191-5-wefu@redhat.com>
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

This patch enables APM X-Gene RTC for XuanTie TH1520.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 3a89f1e6095d..b219aeef4ce9 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1880,7 +1880,7 @@ config RTC_DRV_MT7622
 config RTC_DRV_XGENE
 	tristate "APM X-Gene RTC"
 	depends on HAS_IOMEM
-	depends on ARCH_XGENE || COMPILE_TEST
+	depends on ARCH_XGENE || ARCH_THEAD || COMPILE_TEST
 	help
 	  If you say yes here you get support for the APM X-Gene SoC real time
 	  clock.
-- 
2.44.0


