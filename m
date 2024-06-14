Return-Path: <linux-rtc+bounces-1306-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7938908488
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 09:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 969F91C24836
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 07:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9381818755E;
	Fri, 14 Jun 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VCdJFOfq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDE4186E43
	for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349617; cv=none; b=DGoG+RbislgBc23+34jmljDjiRVMsguRwc5UUcbwu3TGuAEJHGuWomnt1F4tIBRQTHgltoTjeDSC3jkk971j4CONQGWJyErDj180pOWarWCc2621IybJo59Xfh8ASibqRilrPB+mW8EB/pupM0asIF0xMWP2H5Dthq8yW/aM5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349617; c=relaxed/simple;
	bh=KAFnvdRq+2pR7azMtu2K0xo92UGOZLfO30BelL+InbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bo+PWu9puuOd0jZuPAMwwmu3S0Pxk0B5V+dWrCtkG39akdKe42T+fAHvCYo5rkR75Mhau2OtWqt1uD7IGcQJV+HL/ZSPoCGGzYHLyp/u1m6MsNGLdLCQ02MVNywYIbVx1GMsBvziplr2HZNWj2i87FXqV4Q7b+ilG0yMioi5gFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VCdJFOfq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35f089e35e7so1246628f8f.0
        for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349614; x=1718954414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBQryArzwC0pcpfTb6INLK/D8vEzmJaod3AONhND7ow=;
        b=VCdJFOfqQgPTTiObcJs5/lSR5gIhPVm+FegjQBYw3EzGQXAKh5v3SkhcXxgM/K/hJN
         s4qhWo6ezeBjucmDZTgJor3ZbAPe7b1L5hYNf9l/mgbm5GrklXdDbadFl9r1anR8bcME
         a3uX0sgJIrVT1S3+i13ZbCCfps41hzJdp2T6vFyBaKKR2mDxJGTwnDe4x4Wtg+IENvpp
         w5QqnRDFii/fZMEaAxeNzfYZhJ61cWMIcKswoXNgyrEVqcIXbdlFymNnPW4QnlLEci9T
         iVT4wzPASbIpo/qf2K6VpcCbJG7Rnq65dLus4d6ZNBXuNunhWjGUO77kf4WSct6NTLVG
         wVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349614; x=1718954414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBQryArzwC0pcpfTb6INLK/D8vEzmJaod3AONhND7ow=;
        b=WtkPp1EbGMTnHQ7GaiTCOI1cpvC9qyYbWsSmI4fD7Kl13/2MNITZ7thgZRZJk9b+0q
         NaaH3772kP2dolnasq3pfyUzy5lHLZ3ZpDLU0kkm+fpwDsQNv6EKXGSPgAv88F8LbFKh
         Lmo5w87Ls+XDbBRi05MpzSjY8cHFhZ5v0Fpv+va9zVQKb/c2ToFbnJYypACHo4/4ckHB
         o4A0j0ZMkCXSYhN8MNR8unWXxC4OJjqr2lJLIXcXqljr8US8zWBXd+AFwjtQUFT7NDgO
         edgzTXvLyZQsr6xm5shmRFvnOibcoJoskO5AL9qgwdph0QnUykPYJ6QAxnytt9bEgfO7
         5GAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBmzfGnS780zSp2An66m5YChAi1Y5m/zddieaYcHof2sdp8YZKOaAJ99atTx1VaC/w160XEhSVWx7RMYxOQLobMxyWtCw5C6i6
X-Gm-Message-State: AOJu0YwMniGxzzOQFdKVflwnN8H/MCubDWGUf8k/m3IcuFw3DBJEfPsP
	OnZEqP61yFon4QK0Z6VdVqn+2Y7cRlsRKnhcc+JrvUECeWSIEfPA00+emyvYgtE=
X-Google-Smtp-Source: AGHT+IHPaQD10DLPhpZ7aY3WCufuA4Kxyjs3R72r9aYkAI7AVznPL9Zts5GX/ZtfATd4xeTNB6QBsg==
X-Received: by 2002:a05:600c:45c7:b0:422:727c:70b1 with SMTP id 5b1f17b1804b1-4230481f0cbmr18120785e9.8.1718349614367;
        Fri, 14 Jun 2024 00:20:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:13 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/12] arm64: defconfig: Enable VBATTB clock flag
Date: Fri, 14 Jun 2024 10:19:31 +0300
Message-Id: <20240614071932.1014067-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable VBATTB clock driver flag (CONFIG_CLK_VBATTB).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 05abba0a0209..fcb0c7ee8769 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1348,6 +1348,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2


