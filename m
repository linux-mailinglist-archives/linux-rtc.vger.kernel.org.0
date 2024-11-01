Return-Path: <linux-rtc+bounces-2427-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980F9B8E55
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A4E2825E9
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B665199244;
	Fri,  1 Nov 2024 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aBdNrrCJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401915B0E2
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455070; cv=none; b=oY0F1H3XyjYr6bOj2K/oIS8O0kgUUWe24X83INIE2GlWQCy15M+hREWRF67avyxMNBZlsNDQDUGPHsEOEw6x/oaB1W8qeovMzKW6b3zVC0Uj2LOg7iQ+40ZX1UxDbauumOT+aP+IIXfLyguf56doKNtQcUTqdgFXmv0cOPCEvYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455070; c=relaxed/simple;
	bh=TpRf+IPzzflEYM2PIdEujWQYh9I90S6kiE0QI6bogDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NKLaiPbym/FR+Tv1LXLuXhCEbJOzxq9uQnNL61zG0LAX3VH7g6XgDCwTGljV4VlM1/XBW22wJ5NNAD0JM68/3EdlHDTPyD+AYjPrONJNMn+OQY8zRjEBwpCb9QTG/WQp8fDylizN34AQ8vvyOj7HpAmTSdy76Mo0BRJ1VjKYIv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aBdNrrCJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso1612439a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455067; x=1731059867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RfCSiRKPCnvU8GbAS6ruNWu/VWU6I+MnOUaUXq52C0=;
        b=aBdNrrCJfTFIK+HV8864JZzIMfP4dUOPfNn6eRj6ZmMDsQ1Jo7BVt4uXgXHUNX4W35
         QC+utTY/FaojQdD4/1tbcRv+XZa2wV6P0nwLHOu5TYgO4PqDxvY2yq62wFubq+04jKlN
         +8J0Adpaoj6fZ3xPV85aIzqkie+9UtwbehF/I0XXoRnLib3/EcI9OAHQk5VKhUFFwQ5Z
         oNXjvVjNLxUj7plvIpRivudAq9nL81XJOWGUng4zUIvTSJjKuIfAaQucHqrXvKI6Zo2G
         aK3xrMwrt4mGe6LKbIyx4fRTGRtUJWcryVqgc3cAx+hW8fCdwL7yxjfGnOmY5A1gWUEV
         8Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455067; x=1731059867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RfCSiRKPCnvU8GbAS6ruNWu/VWU6I+MnOUaUXq52C0=;
        b=nnSYOFLBTvzIoGzNxbEUTvIfPSYrLsjmrPKwd+9i902ORiYLywDtZh6udW0+fldFSg
         D7Gx6lIqPP9xbyxkIgnIYNbLlUeCTgqYtfhQ9ADJCpLXIjEFhMMC8OtgBVS5MoLpaqd2
         sS1inCT0w/b22ppQEruRCQ1YzufsPAvOD8Ke9Vz7UXffJsyI9Bau7aZnfrXhGoHt6x++
         ywtX73ByxcNefauioP74b5ek9ziDzqE+NKHhtlnImg5ieEjf6MHx3xEOXPVLpvyiwIUl
         rmGTKkqwVVb3PduiKhbyvwfT5V2ZzPWUZP3nIJNiVuFG9yEGf0vb6JkCe83jJlux/362
         +ANQ==
X-Forwarded-Encrypted: i=1; AJvYcCXznPngaKiIr3CCklooX7SusvoGGhLvgfZLghPxsjODLagG64VTCtcJJOJKiB21bigi7etAY3o9hCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp87OwslLLI+nYdN5aMyULqDgAlqmFZbg2FGFke6IODkbRSx7v
	V/CR3DIdhc5GchWlb4z4LHR1oH81uwzmeWvFckcokao4kwPNfn8/OWi5NQxtnA4=
X-Google-Smtp-Source: AGHT+IESf07+Ty6d+mR8h6jLvICrJWZMLVl4M5/vp52FC/zlmrG1YxQrK8z4XTkLNQ78LoV1FRPc3A==
X-Received: by 2002:a05:6402:518d:b0:5c9:5701:f79e with SMTP id 4fb4d7f45d1cf-5cbbf947bf6mr17732684a12.27.1730455066464;
        Fri, 01 Nov 2024 02:57:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:45 -0700 (PDT)
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
Subject: [PATCH v6 4/9] rtc: renesas-rtca3: Fix compilation error on RISC-V
Date: Fri,  1 Nov 2024 11:57:15 +0200
Message-Id: <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
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

Fix the following compilation errors when building the RTCA3 for RISCV:

../drivers/rtc/rtc-renesas-rtca3.c:270:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  270 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECCNT_SEC, sec));
      |                              ^
../drivers/rtc/rtc-renesas-rtca3.c:369:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  369 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECAR_SEC, sec));
      |                              ^
../drivers/rtc/rtc-renesas-rtca3.c:476:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  476 |         cycles = FIELD_GET(RTCA3_RADJ_ADJ, radj);
      |                  ^
../drivers/rtc/rtc-renesas-rtca3.c:523:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  523 |         radj = FIELD_PREP(RTCA3_RADJ_ADJ, abs(cycles));
      |                ^
../drivers/rtc/rtc-renesas-rtca3.c:658:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  658 |         val = FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SEC);
      |               ^

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none; this patch is new


 drivers/rtc/rtc-renesas-rtca3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index abb0f6f73906..d127933bfc8a 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
-- 
2.39.2


