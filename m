Return-Path: <linux-rtc+bounces-6035-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFBdOkaMnGmdJQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6035-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:20:06 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C3117AA3F
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 18:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A4B3309EE1B
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Feb 2026 17:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2767B330D54;
	Mon, 23 Feb 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPuSI1sc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF84A32FA2F
	for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867053; cv=none; b=BHY9gMj694SZ1f3VPeYKk/A4EYfcZ9bWjfUasW2vMJo7cejEpRpRRsiw1sQed6wpNLPLVrCfmoYU3ENkwWiZCcrn6XMBPVlFs16fUE4A12KWhumzbUZJdwBNkWwkZALZV+OqdP71tNvmS90nQIYkUKx0vpMBDH6P6TkfoqWvhdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867053; c=relaxed/simple;
	bh=OZfaPFSqbA2C31QZTHgklz9lyeFU0Jd8/jlpq+HGvJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6xUXOZiiRB1yX0T/1Pi9E/8pMzJH6WclckzIF4WKftftWlx3k/PsiYezxOiesjbtCGz+CnMrMScZMp3j8fQT74M8nmrx65pbAMnylk+br1Uo7w+9PHFiJNHFK0v2tLuDKYxJccu/Uabtvif98GysPiaHv1mo+VfJBedi72a0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPuSI1sc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43767807cf3so3472674f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 23 Feb 2026 09:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867049; x=1772471849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=;
        b=gPuSI1scwCWzlR8FBeZxbwSrPM+9HXa9Pgv+N3SySO1xN4xE3RclTXWEPoKXdIuUGt
         c6tJwU3RdZ+hyeBO4b8J5be5POhh5wlMtmUGIgcIPW19bdabM0TfZGeOmbR21aDa+r+a
         DB9uAVjN7rOHQ8pfNFzRiPhCCyVyWhJJb0igFgYKzAFE7pPTMnrvvBmqla9sHo5fG4s7
         0OOpIexnPfbua2ARxQt20UtF/+wyqimd97WtszzGUPox+HfDxVRjr98j5SFL6h2q0HI7
         mByQM4T6sHDK7RtRv8DkROMYKsf22cIk/q62bSI5btAVLglwRzkf8t0HjxrLVPemgF5X
         yLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867049; x=1772471849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=;
        b=Jazy66Py6CWmAXO/2DO5G/rNk1oB76vtfknWnOs7TK3bDNIbV87xyKrXII8kCcPbVx
         jdG7a+mJYJbgOSWqqWvccukh47edO3fa3NqujUsdTdVf7LafqFl3dybkMtupMxLYi4EG
         uJQIvTu3e17/rb2mshhqtnZAvfSESmUQ24YIsH8n10mphp6E7hSXLephzBsGLX0dyDJj
         44L2+NoML1rTi+HFHI9bXfthq9G4eY1gFiPMPXcXoHl6nrmY2GUFSTc7+j6RyAxKJ3Ju
         1L17crleoH8ubXtrHNUQz8AuU37Gzqwg7/N/iAvv9Gqkxvcn+S9Mch3bRmGOmaZ7wzX/
         BrFw==
X-Forwarded-Encrypted: i=1; AJvYcCV7hs+M3/nRpHR/rr36FlljScO/CGNmV5qhgIHlQgiB+FhImkQhZWX6+V6XhNFimbNey+1PMAnyBSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybfv1A3zuHCPstpcUhmSWGzxPNV9MzqydABeLeehLRb+LPEwhY
	5bVIb5yXr7QuEbsjBZNRixy3GKO9Kc4zwq6mAk0R4tXwrffz9e4+2lis
X-Gm-Gg: ATEYQzyJV0Q6hjC7/agdeaHvdUWenYRs0NCXXwpegS9AN1Rb9Te6O9Oxv/7Tw7FQn8o
	qcfBeMOORsWZwVq4wLLLWgKZhgiYgB5H1d1Uuv5BprDIy3/bF4ZSkb1XiTUNUoXHexbLrPp7LBj
	ZyitR0AVVr2uEPcmpwz8EXz69/hb6jxfKwhBUmReXKofpCTa3X1K25SOXqCum7AjXkeqPptLApm
	kUq8eBV1hjp3NC5g/2b90+jdcGPCWpTr4kBU51olQGbF6UZanoY2Hxvp58RkwfGDSpj9D0diDJx
	P8/1DAdUzz6a0i3xP4Ob34/3JXXQ4VyUFJCqykfpl80frnbIKk2vnBdVhPDR/F0mcIF7Er5b9QD
	KlKC9S9vALLmvmmGjsTD9yrHtgVfUBYrGYaLuNOeHFdm7zTN6ymNbSHtOeil0OUwhsSO5b9W6KH
	AKOFna/mYqyHU1jA+OtuE=
X-Received: by 2002:a05:6000:188e:b0:437:9d2f:8bf1 with SMTP id ffacd0b85a97d-4396f17ce2cmr17527562f8f.38.1771867049261;
        Mon, 23 Feb 2026 09:17:29 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:28 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: regulator: add support for MT6392
Date: Mon, 23 Feb 2026 17:12:41 +0000
Message-ID: <b7664f4d9a7b038b0603b6bba79cfab4e18cbdd6.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,bootlin.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6035-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: A1C3117AA3F
X-Rspamd-Action: no action

From: Fabien Parent <parent.f@gmail.com>

Add binding documentation of the regulator for MT6392 SoCs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 5f422d311d4d..b61fce8f09c0 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -94,6 +94,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


