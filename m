Return-Path: <linux-rtc+bounces-1808-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7AE96626D
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB88C286BC3
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12FC1B3B16;
	Fri, 30 Aug 2024 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QugKe6OJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD651B2EE5
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022975; cv=none; b=QWdY2f6R2m3Ylxk25QSSoB5fjBwxxI8cZbhs8j9yKRrXJEXayVEmdXeCesiyngiTclc/uzM/5/nNfZ2WNEzRqbRNkZRwZZ86hClBnaQySs/PQVkGy37RCk3cyLwEXITqluqbhslROVn1wi7QEcKc+Z/N1VBNbJsaFEuH+Yv4Vws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022975; c=relaxed/simple;
	bh=71cKCxh2lP67wOIct2ANTYnPPxIsv0JGrWq49Hv2hAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bsViqmLmP1fZfWg5UUPZejOCfG16yXL5h9bdgaaJA+ts3vYdyzGLTQJ5cww1OFU3tiCk8Y4bJ4CXCGn8Ip+Ai/Zird8OWX8sR1lTA0k20m00+oqKQ2Ocfk0mWySuqkx1iUEHtF7L9S4Tsv5YVJr2nLFC+nXXh+lG/h078Pc6zDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QugKe6OJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280c55e488so10995775e9.0
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022972; x=1725627772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3wDKjVjYsbUWQ/cY+LDnY6Komdrp4zwFk+fU6Ed6VE=;
        b=QugKe6OJ9ndwXsNPycwURfRCJqT/hWLNDRo9IiSR1SoGvK8GWUfb1X5euAQl5Y2eYw
         9T9ILA+qs/gGd5mrLMX/PyEtI8l/O/1lpTYmIoVt/tfZyLbOXL0lPFMMOYPJ4ABpkkHi
         OAhNPKy3OkGerE8+/dj2M+E0NaoViCy8aB4ARizY6qB69nFE4MxzZ3wItKfD/vusucP4
         sEdxOOOoGzImfzo2Bi6pSoen20bYsHEwShDL3WFXALgWjqNnr2KBHV+m/IxPX3+/jtAP
         c2tVNW5yP3/uQ96eIsiKTcRs53jljtPjcSPP2AQ7yLTF4vbUizPW4NlWEI0xecJxNI2l
         p5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022972; x=1725627772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3wDKjVjYsbUWQ/cY+LDnY6Komdrp4zwFk+fU6Ed6VE=;
        b=m2Jtg5AihRrTVyWkzQkLJGCOYRa992sX5kYyDzrtw6s99b6IslMkLkIOyN1rBUz1c6
         RvBK7wBHKR1HG1V7puJjoAsVgijB8Q1jFwV1zTxUw7zcA/0jOdtlyroeVbUnDM8iV7iH
         h/m/tylU0sBt4LWQ6jIKaCQ0ZMfBH/9qg9HrXuz8PU1KxI9xIlrmzVjISYvD8NaANek1
         tQ0PB1aPr/kn25fMwlYohoryEh099G7Yx1P1v2N018l+JIGgOwBowtx9oqBS2rrF/JjZ
         Gg5G3/LkUG3Nd1Yp/MeZpXX6WiLERg+gdHWYPWnb8sf+BzJdjaL2/zJQ4wJRRfjxbJ64
         GizA==
X-Forwarded-Encrypted: i=1; AJvYcCXvfJI9IGeK212kbR/wcZNkONOrsrir4WzROEKMr+rWmtA05UqmUcqO4rQXIRhZCz2XEhhdm18vG3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcENWGD64pAfZ/WNZrCiVUFD5xYLjx+mkzTZLmqHPp6k7+DWXL
	sq0GOTw3yM+7dDHY1D/FCqNv6GNkSViW+3ptJpcIDWCtslq+3L97XTap8gBFjCc=
X-Google-Smtp-Source: AGHT+IEt0fh7qX9ai2OjXs34VWHMrK1anskSaF9JDjd1vXG1ueCZll0q99NbgTuA38F/kPfX3ifE4g==
X-Received: by 2002:a05:600c:3b0f:b0:426:6fb1:6b64 with SMTP id 5b1f17b1804b1-42bb4c4cbe4mr39745855e9.7.1725022970979;
        Fri, 30 Aug 2024 06:02:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:50 -0700 (PDT)
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
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 10/12] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Fri, 30 Aug 2024 16:02:16 +0300
Message-Id: <20240830130218.3377060-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RTC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 591a90ccfe3c..f911c2aa5e66 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -346,6 +346,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	renesas,vbattb-load-nanofarads = <12500>;
 	status = "okay";
-- 
2.39.2


