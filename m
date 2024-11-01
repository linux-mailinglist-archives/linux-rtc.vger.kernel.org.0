Return-Path: <linux-rtc+bounces-2431-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33E9B8E72
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 11:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D52D1C212CA
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2972D19B586;
	Fri,  1 Nov 2024 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DfXQFLSs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6419F118
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455081; cv=none; b=Sb/1JtRfE30Gzr/JVxr5DzcicgJP/fD25LNz1NSsGTQq9n8RhP3gOzRzi2B9wW9LUmLmbvIh9WnTu+K6pydVdlhqXK3QJNVrrBahTICHlT1+ZaCFX1TzHqtTF6zWsf1JSEzdOFVYVXkJOYSIK6tQBhSd1nmJeVAt6wTQsZ0DO1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455081; c=relaxed/simple;
	bh=Pf9k322Noul/AUoZF1lcvPKEcxZYOYxw5S5eT2YDnXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X5eWN/wtnEi0SBy74vkVhL38kx0a99d4w5/etcNO7vaFW8WlHcArMCpIpang6bSMGyCZgxTjVic46kLuJo6ygkVUat2XhO0NdHsOIFkrk776jTcTQdDAHmijQp/QFDLl2OCObjKkW2Yzpr18dZhYu2hB4HNGsQqUur5Lb5M2ijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DfXQFLSs; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso2666262a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455076; x=1731059876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=DfXQFLSsrbMNA5VOknfWfhySdFrCjvu0tDgwrTEWF1sUtGqbT8H2o/gCGINS0nfl7j
         nouq6LwZH23a9x2wml4xQCO7kR5XuND8zx1qG4+OwTqPart8LGYYvU///slPG0xfhNRz
         3iGfjI65SIjGdrP6opiRuR27K2hWE3QtrLCR6ZdSmbeKwAVCGhYio8n4rqw9VdZCHmJc
         SbCp6ML4isJAZ4q0w80/ROUfyOvxpRSM+mZwYUVUxnWEf2Za4rbFiVXnZO/X2SiJmFRV
         lKCrJsV+lA9gi1SEv1bh8fr+HWB1HJOU5aSTYsUeATkfWePam0hr28Fg989jaizKmSfM
         WDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455076; x=1731059876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=dVJh0zUHKNA2oRI3OIfWFNWKn/1yQBoUougTYzu49VBk1cs85fBXqb0BSWh1oNydl/
         LIdy6yUyHtVcc7rkkFfWmdLGcdS6QytVzT27BGfbQgTd37yXH+C20MUXemq9+6g7CX7j
         4BC66GXsn1lbyHXdZhBhPAbi4J33vspRO+fuXBBu/ScytqVFBf3OTwX91MGpTEE6Gq6q
         HrYh0LtZIA8cxj4psynpmkzQlXlXhXuHMUckeDHCCbRe5F5ScYNaTWJfDpCsXUa5gXBP
         F6ZWV3ZmrcMg2AiQe0V0Z7n6Oqk5ztfs8hnCid6S/a8Vv67qh/4vTVwXjFJ/XZmcHYb7
         /odQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBIGIbUfOUOcLgdxpNenwSycF42yHPzMyh8eiRoNv/dHerAHA5FO6nLlmn1XZloeM+J13uHxjjats=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS87/uJYiKnKXrnLOOtCTtxJ4lW9NffW5by+Tl6x+5t2GreD4b
	OILhvE6Ov5d5trLKzxs1rjVcNGZmf62+FMoX0eDjdn4DQz1/1ha8j4DUSoeM3ddXr4AEJ9HtC7n
	/
X-Google-Smtp-Source: AGHT+IHIInFyvvZ21N4w9XKZUzECowUn+aG9F5+oWwykmTnOmG6gYMfAOXIH3hB+PUh/16T6BdSrwQ==
X-Received: by 2002:a05:6402:518a:b0:5c9:76ca:705b with SMTP id 4fb4d7f45d1cf-5cd54afde73mr7392400a12.34.1730455075953;
        Fri, 01 Nov 2024 02:57:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:54 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 8/9] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Fri,  1 Nov 2024 11:57:19 +0200
Message-Id: <20241101095720.2247815-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 30bb4f5a7dfd..2ed01d391554 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -345,6 +345,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	assigned-clocks = <&vbattb VBATTB_MUX>;
 	assigned-clock-parents = <&vbattb VBATTB_XC>;
-- 
2.39.2


