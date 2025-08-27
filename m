Return-Path: <linux-rtc+bounces-4773-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A6B380DD
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1FF7C1C62
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D667352FCA;
	Wed, 27 Aug 2025 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtFoYtPZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5C034F463;
	Wed, 27 Aug 2025 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293814; cv=none; b=mn5IWt5cLaudZiDE2SxhrGl/EE4+cJmbRBQt3I9TKSh99iQEYkklMxREXF8ZMW7H09s1A8o9sE8TLQwS4CwMOATXewOACjanjfkIHtJqFTqG3NFJX4JAUJH7Xx7lhVUGSkm1H2vBTHjoT5hHXTiGloiB2iT95K4gF6/dfg0HlnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293814; c=relaxed/simple;
	bh=MzVBIMhZBV0HKkjqFJuByEq0RXCQQFero/TsgkVgPbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0XeJgGjy7TlmsLGQQnuTPdhCc6N8pZU1ZBvm5YokVgVfAwTPLaQdCvInoAOn45fA+hpROOYZdib8KlYfHKpCMccFvQGa7+8WfmdpvkR+dgJVph35Cbyncjr/3cuYmDwv6N1FMQA+MGsvCUHj7FvZoDNsUZI65EHzbVwlXu+5XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtFoYtPZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3256986ca60so4435864a91.1;
        Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293812; x=1756898612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG7aBav28TifE54xitzYyiUVJ1+ZLQf1Whcw7hJdaHY=;
        b=VtFoYtPZ34SPE0juMHKDAKTBOHZikGkkA8PIfsSTzvcA3NUWk5WNYKSdHx+rGI9Bpq
         QGaz37+2ZEo8mpJcoaJ/Khgl5Hp71jE4FX5vURzeYWxOnFfI7Ue7by7VVlAR/nZ9nuJB
         4Oz1jvc4tPJ4f48/6SnUOb6INYGpyPe+c1Z3a84aV3fxtbQlYGTnT7AdwnadUPOlKE/b
         kyvBFCREeIWfE+yy6Vn0/qxrOdpoq3nkatuZvARoucuyOIFVc5OCxgbsARUW1g6xRcaq
         9WUP0qoPYF5pUnX+wjgum6tmgX1VbEdY1lE7k3ChnxMojZdANI5ejZQY3ij9VIMsolW+
         ognA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293812; x=1756898612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG7aBav28TifE54xitzYyiUVJ1+ZLQf1Whcw7hJdaHY=;
        b=o7dDZ7rwv7HL6doRr2M/bC4znyKCj3pzJngEm7fK7MGGVjrV/OQV08OsQ+RbnHGY7p
         EbgXrLF7LZvZEH1z3s9yUoT2A7GQ0Ro7L+v+tN/Mj5gjf+HGWFOlZiAIITOJYEzY5lR3
         x213eBYDswJHFiuS4gLoHD75V1GANuFJyvM1lwdzcqra/dTruI16ziOT4VeD04D2zzqX
         DScGJGoPAantDYAPPdAZaZq9IRzPQC+ch6yAwKPJic1uKvUJCKbKsmZ9Yov0HqbXwCcf
         7XwYB1KUXGQwnzBTzsd4jGY2ZBEanQCfcP4R8IDpz0JMXHiA02bm07PNPsXofxBG/oDT
         QaWA==
X-Forwarded-Encrypted: i=1; AJvYcCUagAiIjyU/Wos7SDef3Y4hKS/Hbk06TXNSTgZutXoJpCa4H4t+IBLyQ5duhX6X+roymmTJcJKv10GokJA=@vger.kernel.org, AJvYcCWLciIJedwm2fyLwZaLxPAb4iwfGvV+FCDsbfh363FB1MwMpXPnoMHVyRNN/2Uckd69mcIn5fksk0Am@vger.kernel.org, AJvYcCXVWlBAe+8pfuCACddvp0ac65+jAN5EqPym9gtqX1k3NWWS7t8nQjlA3rShy+2+uvdTRkTmlLqsgztQ@vger.kernel.org, AJvYcCXetjIdaRXtpdQ7WOsbizs3xJ8QXdPVRH5SARuSvQRcnHilKki8Gi+7sdtu04P8RPIsLfnp5/kimivG4Cwq@vger.kernel.org, AJvYcCXqeDcnvq3pjz6MUuCcbJSUuq8gzHkBwyjC6rOrmSkRGK9b9JE+Vzf91N+UfBjQ2nFhWJwl9XrNE39S7Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOE0REb9RNlMgkfzyC7Ao+ZZzLxZ38qoR5xpkDjORHNzNx2j1
	e9dZaQIerYQk33qJr3No5cU8Lp/5xTONzvli5OMdXEGAeANQpuR+8jwk
X-Gm-Gg: ASbGnctyviiRIC5Yi+pxcsxktETyC7nvW++oBHAMBcPxNW+Vbcw85XY+qEG6k7cbJ7V
	xp/IIVCnlItEVJGWbvhdKDfB2Y1tPitfMPyaqP494IFEaZXKExkH+GukaXloE/VTX4JldFUoEpM
	U3T2Bi++3mnbAjFeZJwWWXOinKgfNqIu31F2jPIvAGegI/eOpZAIIvYbzZlGqbERGuvEzG+bafI
	WOeBIBUQT3oBECUwY1sl6X0QaWenD+gemEB8Lpfl2u50kRrA/3JSkDn2tT0I5w7IKzjse0zFQLN
	H5LNPrufpEh+njiDaJy1G6aGjiwHbkWi2DLe8oAWSKMlmjU1Rd1yQ8J6h8paziPsAMtHzMowy68
	9wmrWyU5OajdPIUrW5ZmnkDRv+rCabDjBQa0IFCbC6+3qXznbpsd+TfmfH6RUgGdn3GguqKYsD2
	HCsr43jXVNR87PFS47
X-Google-Smtp-Source: AGHT+IGiOxv9V6MjUF8W3nBziWAzOujTYr/YcybLHLky8CSMlEhB3V6Q2vxGNJMmePXDcxETbRO/Dw==
X-Received: by 2002:a17:90b:4c02:b0:31e:ec02:229b with SMTP id 98e67ed59e1d1-32515eabb9bmr25336674a91.20.1756293812432;
        Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:40 +1000
Subject: [PATCH v2 06/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-6-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=MzVBIMhZBV0HKkjqFJuByEq0RXCQQFero/TsgkVgPbo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjVnT/rJIPuE60z/BsMkY5Gacx1BZhKGvuYro+yPT
 3c5xTS5o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlosjEy9L2TsF6fId9yp/VY
 El/Q7mvv1uUbH3n+v9ni/KuPixomnmRkeBJt73vIvPNu2Z010ltm2P91mTn3zzOJQzuOfT/6kqn
 IgRUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 59be894460d33afa754927630881532b548b7ad8..286dc150aa6cfdd6d29f769094278daaddabe7c3 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0


