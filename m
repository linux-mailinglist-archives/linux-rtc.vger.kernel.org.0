Return-Path: <linux-rtc+bounces-6033-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3zJUFvGLnGmdJQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6033-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:18:41 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7417A97D
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF8F4304FB5B
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9805330B3F;
	Mon, 23 Feb 2026 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9IPm/hf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DAA33066E
	for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867031; cv=none; b=aoGMjT7rAy8GwG2on52rRXPUtPlio6e3WpAblL4/+spGHPHRhGJXo2pf6kFBbRQEHSX5W83y6JHXwUSoDsvbyHPL8uq5HEH7b1ywjl8bxH0tbGjP6CdkxyrjCSTe0VKaOT97sEsmw86TmK48KPAl7y+qhJBD/p+DutUk30UOOdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867031; c=relaxed/simple;
	bh=WVs/g4cQmQqVe2J2+nIoMwPE/ef3LT19rVqgZxkT9UE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fkaDYJ8BwYVNLF3e+Q1AluRqobE+O7jWzBC7qcZczVlCR4hZ35UlanKMjRJ4TpQfirb4iHVMOFQUZKeS2n/xq4S251bePXqhls5VpYQ4FyyRhAWkOt35ooXsCEPgI0RKAV5a1y4UdOqN793ccrMR3lHKtDxZLERn9v8TwBuBipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9IPm/hf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-436309f1ad7so3454760f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 09:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867029; x=1772471829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=;
        b=V9IPm/hfjv8OQgb6O/hWFilVSPV6B+cULb9Tcqm7zCE4kaTuD0eH4Rmk/iO6R2Kz43
         qkS/HitSuu7H09EBA/wA4xYFKAO/kcOapN63tSN6QTGT8kPketMJEGOUOCE8/nd5jfMp
         gBztAqzIcksfDSpur1ZaaVoWE6p/g5fp7uRK8bVBpAgWAeQhUt+S+QoYi4qf/mW9r+BD
         MyvRSBZVgxG+I/UvWvg/+Gfh/Ksw8IKbcKiAOCeokmyQessNhLoDISCTIJJLX6Z4OF8u
         OTdeIpJ6VOvCEGz4O4wNIgOqKFn6KopgDnWtB6M/vv+3XdIV0dHPMhYqmud0rV9U0a70
         iDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867029; x=1772471829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=;
        b=LVLuHF4E0e+1xBwpZcUCvVYbZSuKzFR0A1ylHuOI6NApQ9G101ZQhGgp8VFjFn4mr3
         W2Z4c1xNd4YWPOZ8UgAg20F747H9SD8SNrCTLnPBOgYQnX39Mg4WMd/5ih7weboJoabd
         0hrCnFcKHJtWUcUFg9Sd5Sy75ih2keOE6nCtNO41E6PQfvNArZyJ+1d9tsQlGC3gr8cs
         eeSEgO3seAnZeqX2xaTl2vvwfLR1VrDTWTdHTvSXlJlKiicBd9K6A/4cRfMB5H2kEcvI
         lvcfxGJQJvpHiSzDKh5czPKp94au6mW1MJ4JgocE3XllE+hr9weeeV8vEGWTbNB8EWjO
         NxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxgxsheiMrO3lLYn6v6I+L+p63pLD+4nVUvLfzcEnYVjOavkRjTTuwQ33PRgfC+DFP0o9px8tMMPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9+JduZY0/D5tyY04xqpf9iy8I9CZTs8T88nNa2J7Fd+JDxFY
	GaVv14BK7nh+zDnX0Sp5927wqS516xtB66djkKHspGv+xakE4YOofh9w
X-Gm-Gg: ATEYQzz2jOGHJWeFbeq2YWgOBvDTIi2khUowCLXREWsQsxQAzy/qyOQhqG9vPI4bRRS
	SM9LlFTQoNltPDOT8KwYX+8cg/dyDbYtNAgYi5bFfgnxUrx1pVgJuHT/9hCqFd+4hg/zQ3zFId8
	YTaSCYH4Ey8EKY/04/BqKkTnjAnnRBUL/Z0N5rKIwxfxv/hWEbCAYYO7e2TG2sLMhL5j5+9BVdo
	KciaRpeDcejakW3XwRyZyMHpVt61Le2ml2DwUwJW9o3hdozSTAsu9Tc+oQzWEhDpVXR1eCo5cHo
	rs4ENnFRvXhm5oUvKv3KoHIVa0HXQyz/6MO8mMdJ7OlFZzeM+aQkuQ66wqjQTJijHRu70vrGWab
	P3mkL3uQSUzOu+EFaOW+mihjg0NTWQi09fT9/32wMdJvzrK2c2E2D421UP+fuaY6Z8q8HSrLEaS
	UJDkHKiHIsD7HhSTceq+M=
X-Received: by 2002:a05:6000:2910:b0:437:8111:e2d0 with SMTP id ffacd0b85a97d-4396f1562efmr16272260f8f.8.1771867028658;
        Mon, 23 Feb 2026 09:17:08 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:08 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 0/9] Add support for mt6392 PMIC
Date: Mon, 23 Feb 2026 17:12:39 +0000
Message-ID: <cover.1771865014.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,bootlin.com,packett.cool,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6033-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13F7417A97D
X-Rspamd-Action: no action

The MediaTek mt6392 PMIC is usually found on devices powered by
the mt8516/mt8167 SoC, and is yet another mt6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables three functions: regulators, keys, and RTC.

I have added a handful of device tree improvements to fix some
dtbs_check errors and addressed the comments from last year's
reviews. The series has been tested on Xiaomi Mi Smart Clock x04g.

Fabien Parent (5):
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: regulator: add support for MT6392
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator

Val Packett (4):
  soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
  input: keyboard: mtk-pmic-keys: add MT6392 support
  rtc: mt6397: add compatible for MT6392 PMIC
  arm64: dts: mt6392: add mt6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   3 +
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 133 +++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  15 +
 drivers/mfd/mt6397-core.c                     |  43 ++
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 491 ++++++++++++++++++
 drivers/rtc/rtc-mt6397.c                      |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          |   1 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 15 files changed, 1276 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


