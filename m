Return-Path: <linux-rtc+bounces-6664-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TJlGKyAgMGq4OQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6664-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:54:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EBC687F00
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:54:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bnkPjCHD;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6664-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6664-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A58ED30C3464
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38210400E1E;
	Mon, 15 Jun 2026 15:48:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7262407CCE
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538510; cv=none; b=uko8PfOf+fttE0/2HFaWKRxg0PK9VrutPGkBWXTCm0oedp0dMFbYJDDHnt3KQ/SPkD/MziKpsXUC/p6MbPibAQKR4Gd0hlNeA8pE1rm5vjK2MtfefimKGyFOoEstVLY8dyjShw9zuXDEsdxVzcV/biJDDm+Y6mBafTtUJQPagQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538510; c=relaxed/simple;
	bh=ON7Z9N+BusoLW2abOlOvuPQACWu9rFAjcD8AKM9aY3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7rU4kI3Q0600tvqqXIr4F+dR5Ao5rAaWvLFkwA8U5a0iE1Dw3ryDyb8NnIEWMOia2PF+po6gwgZ4BMLYh5dr5vEsOYSMakQUA0lFr0bBbLw81GAtDTN0JqFb3Wa8/iZJHajMkHbmJpzrTrptgI8dXWqI3JrjX+H8GWCctb1gLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnkPjCHD; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3997021f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538505; x=1782143305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8wLD9zxqwXDPnyCjq4DuwsGKzd0OYW0pMm0bgsfQds=;
        b=bnkPjCHDrEOkRVlzOORB7pCHzyCqmcelnNC1HNXfV9ONXNuFYo74VofxlGAEIxkBUn
         xHmRmJZ8Gi1e2LeGL+74vg86sGkxTMoap1TH9rbWvjnwCLAzJt/MQtodWUY5TKsLR90k
         3+3LY15fVDzXgmn2I3d0kZE8TpY50SzSvA1TwUEq5usfW/YoV/PAq/ObyJHml4xofTCc
         fCTIx+sizXAUn0EBj1WMGO2TGTGXDUc2QG+8mdjnq/5a2AzRowocJ0/+b4X7CHisEgwb
         5qGhdjGhZr1lKUdKNHmLOHDMPBoZ9We536Lu8CRxW5h8FwcfmM24WvlzqTSI6yz3odFl
         EIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538505; x=1782143305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8wLD9zxqwXDPnyCjq4DuwsGKzd0OYW0pMm0bgsfQds=;
        b=mkFytaqCAJ8Wx9hRFlkMy0kEK8/m5rND0j43t2UfidsPCNlrKUZJKOTE6JA+XTf/8e
         OrIhKRfrcNgm/NZvlNFjEHpUF45IHW2lET9ivk6ohaJzrq6I6s21IAyagndPch6uaYwv
         hAMyTrOrNjBMVyGHJNr9GeF8TZTQbYdXMZGkeHmGVkBFqnZF5xe8nlfn2GN+lqI+JafG
         3lfl7S3ISo8h7QXwrZwnC0IkklTpuTuk6++emRoAd4mrlF8dk2x7KZbKReL7L+04sdLW
         aihUG4f9f4wBnIuDKmrEkZTVcsVSLyY1DBrVT5oImGeUqq5+3/SpW2mfvfN+rvqT19L6
         HJMA==
X-Gm-Message-State: AOJu0Yxf+b/ETLB3ZosVS6zofS0zUhEEIA94opvqCm+z1aCz29BaPC9L
	j22Nj3Mo0vKhOzZtvE/8PeyvWtHvyPSn+XrYeme82n09AwmO7X89ZLAH
X-Gm-Gg: Acq92OF4o52uNC4Jy7p/MNUFrI3BSDt+nVIcZ/QFasd4O9zjUSdkBtaZ8iOo6E0/3xg
	9cSVlHzkylGiprY7rpndcWXgmFn+LH/RBBo4i3ZPvjgXUCYbsLiybnhH54oUPTVDyHQj2h0352R
	nVykkNtYBQbnUTpdAXP8I9MBbKlQ7x8OEK9gFoqOphMW1P7AWdMgoZobE1cEQ1xW2ZTpCVh2Rpq
	Tk47wf3Ap0giWY36FaypaeykxT0qG/Es8idcHhRUG02ZfmPWQCermT8Cc6fEBek0G2W2fEEwz6O
	1CxD/smdRyV9nUqpuny4Yo325Pn8eflz+/8iWrzUgvSkRmmvP55oJJ7vaEeuLkkSwXx8bFcWYCi
	zOC8M0ONYdQqMkbNI9zL4bSLpXnzkxAmeFQTzZxGUzO4BJx4h/p7UIP2R43NLTNmcVxzKdDj+lc
	z886y35iGJ2dV1RB+BoxA+0xJQ8n8OSCED2X5RZED4A5nje/efjVh2pzgBcMGb+gXDGV+eIEw/G
	i/7w5sgcDZ9i7SSlgC9h+E3dme0+JCmuR8W
X-Received: by 2002:a05:6000:290e:b0:45e:f381:cd7b with SMTP id ffacd0b85a97d-4606da6985fmr21913290f8f.8.1781538505346;
        Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 06/12] rtc: rzn1: Sort headers alphabetically
Date: Mon, 15 Jun 2026 16:47:59 +0100
Message-ID: <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6664-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60EBC687F00

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sorting headers alphabetically helps locating duplicates, and make it
easier to figure out where to insert new headers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 12a319e9112c..fe21fa624288 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -15,8 +15,8 @@
 #include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
-#include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
-- 
2.54.0


