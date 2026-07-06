Return-Path: <linux-rtc+bounces-6907-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TMzkF+iAS2opSgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6907-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:18:16 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BB70F10C
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:18:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=etYY2VEh;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6907-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6907-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82DC231EA3F7
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4F14D8DAD;
	Mon,  6 Jul 2026 09:32:50 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1271447ECDE
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330369; cv=none; b=IsVDMqoY6+SwS+C7zOO9OlSJBvumH0gfkjvkNdvQlJzkClg9WTQbPntQ64uGy754bfeeBDCP8QPTe1xQwqtfBaIXp6qfx5htSEdWmW8NDcDc8uA/tG7W+AntU3sHVq68bNJhourJc17xJX1Wkh1QXrgd9hxIM9/tE/uMWhuNY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330369; c=relaxed/simple;
	bh=kzpkNVHYIKUHVyZbGK6pa3WRAS/uHKJWiKBBr/HRbXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ieViOx7SKh9fyAwKEFPNbjMvPt9xQF9Io57MCaqdAgkUWWITeFaTKpUWP2TzjQ2HaGUqE0AvrfUW0kFSu+CmK4uJ4WSL491dGvOlyW7l27koByi9XHDhwfnX1DYK1LgyG39ZvV8RV79olHnL3y4+SlzuDDeHGUbVTvK94piuBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=etYY2VEh; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso26827765e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330361; x=1783935161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=etYY2VEhxV0DUuy4HJmkTbcG48wwQKwpPDHdQM72HvfDsN/Tah5uU/0Wh1FB+J599t
         zr+Nb5v5GgRD/CrZaXRWS6mFfCLRC8Ax2qG95n0dDewg/VRDv6HYaDNUHC8QST6TCkIY
         VIowNpgsPzpSrsW6VNskMrUU1Do02DDH0ESH0scHtv4yCPmO6MaiNtgWmbB5QvTSv2Iw
         +MxIY+nUT0FcfIYw9ZY5Qkq6SSiIQmCQi6xbZm2CvjGnFCSviicAgUPonCI0BjDccJ8T
         2nof1/YocOZ25zHV7Tqi367snYX7+16gN+WtWVcX6T8YgsPuG3NwhGwBLhWePqBBm51D
         LzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330361; x=1783935161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=Ix2e51vhnxBb0Asq8oJXvPV+Yv2Q/u/+fahZUxy7QiklM2Qs2j7jAOJCHMDTg7bGaX
         w5F+ykR/Rfi03BslBXRsYn9x5ho7hO58Nk0KeFjrQn4DT7QAwO2VYt++IX86Mk+67YDP
         dEPETR1SBDqby//7kIOUE9yln6kSJXjLZAYzF5IayFY6N4e5o1hzw72YXkj4m77gsHn8
         nBGVdN4uP8IRecVYL69IhXsE7qIOGTGmzgW5ECOPtvh8vhGl36Ig0h+Exrkmik3rLFCA
         VeFkKlmhNp2o28hz8ZtdT1Um1ykbIguTzB2xBjb1uhBdG4MoaJOeUwNKwbp+IgPVqPSr
         YMtA==
X-Gm-Message-State: AOJu0YxufqegOaFsrldF9+lsCpTCNJydL7A8oK8u+YN+L8l1E9OKxnTs
	duppV/UG3nUyViyZGm6TE4YMV4syn89FQDMc7v+1IuV2qCzCKI09IqLAqrraUxyQtLM=
X-Gm-Gg: AfdE7clMuKccyD8cBE26jCixxQfKNiP90qoKlNBmZpBcs5Ot29Q9nfSHskxeGiOiNGN
	gYjrHUzMmvhGcEzFjkQmI8YaSfztrnU8UOwY/c9H3OwpNcsc00F4pn26NPJbFLi2Wo/zTomQ8og
	XtGU0Lbu5mua/MMUEuBs16jngN1wu3kef7oi+D9ZBP7FCFfypWtRoVmeBVrpd3kqYzawZllks4w
	bsOBgFKJa96bpqygpR4bmxP5KMbwHo5VH0bpwecWieeP7nYz3ur8FEpEDziuf55v+g9n3N09v9w
	6acchaN8yj23q48tUetpHAMZD4D2gynvdFmaF6/fjvtFzAsIa4sWdwwL0wDZpZqDhKH6XGTusD0
	yicKFnUbZ0TK09v86hbNqyclN6QIRabpprS5fgeUwnJN0ez1ARc4FmVswo1ON8QILGdTy7A973B
	/ZMubJk0zTNu8=
X-Received: by 2002:a05:600c:154b:b0:493:b6c2:cd96 with SMTP id 5b1f17b1804b1-493d11d9d42mr108969265e9.12.1783330361468;
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef1807asm313598145e9.1.2026.07.06.02.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:15 +0200
Subject: [PATCH v4 7/9] clk: sunxi-ng: mux: remove unneeded export
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-7-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kzpkNVHYIKUHVyZbGK6pa3WRAS/uHKJWiKBBr/HRbXI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YmfyJmVNfRc9dDNX3FlRKXkCm2eEX+2FSO9
 mfy8XRdF/mJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JgAKCRDm/A8cN/La
 hdH3EACDjsiUBV1SbTRjs1G5s78KTZ7oS6GSWyf2BTTtMn2V+5Nd2ocIN7/1OTU7qHO4E9aL3rN
 IMb4bcM6XqK+z8uxaQbFr0DrRbOlRiKi/XmUhyDUiIWESP6KvjBz4nHc3tmADEMTfUurLk4i8ZC
 jJI5yXP5XGOJnxN5gv6H/ys6bWkTwHvLwjtiQ2pt7JhjX9iygJIpSePXEJnUIU+Pqb+NX3VRZ+P
 DIbcyijahmDuqlXmLX9kEGF1ERLFAgkKu/NZxY2mlpYaii62SDIeSyTU08c6lU6dNgBjkQrxDSd
 lIaWjbHZ/aodMn8hJ3rR4fQQsQxH4qHroEo3j04r1zV1EblJSAzxUEZoszz6lVI1Fr7uwVWgauq
 mOvMReWiwP9yClUSeooOR7ImTXwXBAQomS3AymvWdRLuVg8E54+rxShJLJO4bU2mcX8JQbb3sZG
 fNMmPCK3wUYK5T//1e/Zz+UBYDuzWKPCkp+IHcyKZ6S01hoSp0BKHyPEpZUenx7vvXGe1NiKvEH
 Gm5iLLR+PbCJYa5t/+jroacHVeaXyBlh0jZEeg/6BhNaxisiSOcBgH/JV9VR3ZX1jeQxjmDb6JV
 0OOwgs/kUxvIwbg7N2dx8FjWocPUJJKqJGP8lCym5w6a9r/kNPszSOSMaUvhWJQaw0NrtpJhxQc
 kUIvmMxZfVwXFxA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6907-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C28BB70F10C

The export ccu_mux_helper_apply_prediv() symbol is actually not
necessary. No module other than sunxi-ccu would use it at the moment
so just remove the export.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 775d396ccf31..1a441745e796 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -66,7 +66,6 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 {
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
 unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,

-- 
2.47.3


