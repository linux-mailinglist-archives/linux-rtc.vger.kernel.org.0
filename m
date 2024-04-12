Return-Path: <linux-rtc+bounces-1018-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D629C8A28B6
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 10:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B4B51F22333
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDCE50A6E;
	Fri, 12 Apr 2024 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cq4twCVr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48F4F8BC
	for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908985; cv=none; b=lY1H3v/oySqwmiUzVHGHQ0gGGQzzT+XKmALpi2w0jNwzJZ8PUTkftz1YfCJ+cz8Q89VRrMbuXIXJtmUEiI59NTbDutkw7ajoK+xvIO89bEN8TdXBvkeQkbUusjuQ2E4uxzzeu7kaQBIWoC00GUezFxFl7NBTr3QCV3t71lelJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908985; c=relaxed/simple;
	bh=OpO8oB2yCRllOLrXtydV1XjyFATr3uDCO6/EuRZx4a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lE5z9pgWWMiDgEqTrGtEdZZ/el7XP8WaWpZ3HGJOgYN7GsL27zvQPAHFLj+qnT90vp+yNUUk6A4TqsOVuPQTSC9ASE5ffrXjo7IKkHyffgc+R19qld6wFjNnTXz/Rnnu1iegM+YJ3zvtbHLzByjRqIsZyrAhjmNyre57wyQyKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cq4twCVr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lECrQISwTyfiQuZfzhaacIj2l/HO/4HjKmgRSsbNnU4=;
	b=cq4twCVrTF63/ASX6dY8ZBp464jmMCqNBhzQiOKuXKsmyM6b20Bg+TqQjWW5XMYtT6L/a2
	j5l+BvniKV1BZi5dptldScyOgW4pfkLnZfGk47WArfVhsACBqWPai1FSCV1PCvRlUw8Kvf
	0LebkUSzoBzK8kIbc6sStk0lZ9UHZaA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-AqfYSf6YNdGTkiv0cPOSLQ-1; Fri, 12 Apr 2024 04:03:00 -0400
X-MC-Unique: AqfYSf6YNdGTkiv0cPOSLQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2a2c4a28e43so564589a91.2
        for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 01:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908979; x=1713513779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lECrQISwTyfiQuZfzhaacIj2l/HO/4HjKmgRSsbNnU4=;
        b=M28ajjDIrrIPzUJwO1cdWiyhmLD5ZWr+An81SYXeTINZ1/LiI8Y4bEHdTsUHjCdJos
         sGZ9x34hdsrc9NkGTMqrR2X19KDUA0Q9GeygsDDabl0mzo3LY3GjNE/mMMsefFU4XrkN
         AgTeeNipO9aJizE4FamB2v2iv84/RlUVLzJT1zp0fVxJjTXULOgJETyxp80flP6c+Glu
         6Sx/e+iHTFVj94OU7M/9wo8fEVQ7EAUkebYwek+apQLii5tFVyfH/3vsEZZhyeIPNrM5
         fNmDWC41RsLi6L6xt2QN3MyuFIu4p9jaJf+ytJYF7gv/CZisntcPfNfD8+5qP0uFqoQn
         gmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8tjuimltCqilmgDEN4tGOC0ZL1NUkYPkpRhqkW5W0yyi4HR6UpkEWRS61RGwIlr3qHUPybFPT01UfSLIcWlykCtxYVqA900bO
X-Gm-Message-State: AOJu0Yyl/yMa2dAcTeUJwK9mJsz2Y6cpawqdgfZ6hvnZD6usCJ562pt8
	gjBfjn4e0Loqj3ZPPGehKY2f9iOJ4xnJQVCCQH7U8NciO6uCbE43tHT80LeRvQOWV59Q4E1Tl4O
	Oado0STIIh8hk8rWGANwG0crllRLjCAROOFArxqocGFRyzETALcSweH+Q8Q==
X-Received: by 2002:a17:90b:1001:b0:2a2:775:9830 with SMTP id gm1-20020a17090b100100b002a207759830mr1909382pjb.11.1712908978897;
        Fri, 12 Apr 2024 01:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF24h9XG4blfy/RFGcd4FjC17Unma1YbnMvxv8GsHe0ou75G0czKI/fwNaCpVH6a/ltnSojBg==
X-Received: by 2002:a17:90b:1001:b0:2a2:775:9830 with SMTP id gm1-20020a17090b100100b002a207759830mr1909371pjb.11.1712908978644;
        Fri, 12 Apr 2024 01:02:58 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:02:58 -0700 (PDT)
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
Subject: [PATCH 3/5] drivers/rtc/rtc-xgene: Add "snps,dw-apb-rtc" into the "compatible"
Date: Fri, 12 Apr 2024 16:01:45 +0800
Message-ID: <20240412080238.134191-4-wefu@redhat.com>
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

This patch add "snps,dw-apb-rtc" into the "compatible".

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 drivers/rtc/rtc-xgene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index 4d6f1629b973..5163682f9816 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -287,6 +287,7 @@ static SIMPLE_DEV_PM_OPS(xgene_rtc_pm_ops, xgene_rtc_suspend, xgene_rtc_resume);
 #ifdef CONFIG_OF
 static const struct of_device_id xgene_rtc_of_match[] = {
 	{.compatible = "apm,xgene-rtc" },
+	{.compatible = "snps,dw-apb-rtc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, xgene_rtc_of_match);
-- 
2.44.0


