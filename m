Return-Path: <linux-rtc+bounces-6473-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIj7I0xx+2kNbQMAu9opvQ
	(envelope-from <linux-rtc+bounces-6473-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:50:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332A4DE4E0
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F6CF3025F49
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2026 16:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B504A1381;
	Wed,  6 May 2026 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkJvC5rX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC174968E6
	for <linux-rtc@vger.kernel.org>; Wed,  6 May 2026 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086164; cv=none; b=XJJvDwZkk2zdDIabzvO3r6QafCGLmgl99hLml+bToGj5g/LoEzhl0gv9NY+OFd/0JC4v1y5b60TAIe5JfZT2p5YlY2QLq3RxQl+bhnGOyQroooPzhmPOY6JpYNppDke3QInpLlFoOiZ2qSGm6+yv8GjZVj6Pw/C0M99VgLeZqsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086164; c=relaxed/simple;
	bh=wzCBPvBCkMMqnErOKQmwD5AV3I93Zdz23r/gv5O1Gw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/J6X10n00kajnBfmfKcoKS0AwVAwTdRqbLJb94U8X593NVJmifuwfiugPtaqB7AK2/0hoUbNPyPpNxkBf0eeMUi6//BR+Fdt8DATJPcrukcZJvn8kgnJvzYObJ7+nCdm9soqAAAog2pxRk8dtZVImfHUpdG5zbyyHl+SJhkKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkJvC5rX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso79005735e9.3
        for <linux-rtc@vger.kernel.org>; Wed, 06 May 2026 09:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086160; x=1778690960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STu6TPkqcvci8Vu+kzoZratWgCIQTVhRpqVSL/zlfsE=;
        b=TkJvC5rXIkAOMYOk5S8fvxdzGZ/VGOZyqGQ4LzcQkOOtASKHgvzNmAiE4vd2zQvAB5
         CSrq/9dvF5UDWaobyEQxziXEsbbeg35Bx1aG6gjXPuopBaLM+nrlPp5MbP1MBn5blFoE
         72nBNqorTn1AeQFAWzyhQI7V7F0YW8dJnlBNlPaoAPMI5j8/tc//jsvkHM0qJWzc2spN
         Nw4UQsySWftPQAeQSSzVP+8TQt5IgfnjLUdt2HdKjlgffgkxjNGurng4R59/7Kw9Hh0J
         cu6Utvf+OtS9snjM6H5Ycw87/WF9YCKRUcGNZTY+HZtiFuibhwZW9FV5WzXhXMEnkCvh
         5cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086160; x=1778690960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=STu6TPkqcvci8Vu+kzoZratWgCIQTVhRpqVSL/zlfsE=;
        b=mYkNVgnSKt9znfUkJ5kzhOSVDgVPVf95LHJP/rM2LLgHwAmvGT3zvtT+uDXlSrfGot
         VuN1Vw8rrR/9u0mf0/+YkvcKP0XQqvKCy7a0dE4Kf+GRDwTdCQsqHOnEJgXcNPmuTtxs
         HgokESdhkKK69uSCZXTFkMubztML1Xckm9GBsmLYkS1JpCkNe1BYhv2BG/28+mAoGG8v
         nRkNoDaYKHRIPI+320HvccDO97AnijF66YBbB5I8f/sK2vNqs623zaGAgm25yg8yMWZ3
         W0vTPh1FFVuoAJkidEbhDDbZSecbwdMAobYAqd33+jc1hB+joS8oMiTYYrrP+X3AzwRI
         q+RA==
X-Gm-Message-State: AOJu0YxVNL3oTFZo4iBzhuWYa8E9Lm76RgluEca1FBLakY0O9PluO7RW
	ABf2n34/kY3H4xsCOvpSvd65CtSqKmPDEtQ6PU1dY4l06ve8QX2xy3LU
X-Gm-Gg: AeBDieuW6fmGPxXn1uFMP+vdWa7+pWCbnbnA67oL7p0b0MrkLx1BiJs+6Eco3oWuBWM
	g0K1P6sRy8TzlrCCGhS22IHBoZ865opHnk4+wALxSD7CKvm4fMorGwXnyYCkWrq4iCQ7tbIYCeq
	ohG9HsndtMI/WJDcNrF3gcglWs/UbVgH6nrcgRx9WNAbPeeU9O0gFZhqf0J9Wa3f8sfbdfb/hMa
	dX508hG9Xkf+7XPrSeT9Ya/fw7nCFOkBVrCqrRV7MnbOcOThp+o8y6sjG2Y8xKQeq+C/DvYrz3i
	Sh4zC0DC52JLxwsY5ZRdtivk+6idvpF+/55tnk4YgP1YQiQ4AbNp6kYjXwzc/L9L7MqB1Xjnl1X
	6EnQN5B5snwJkAXpT0bdDntDZIar/6vYSOgU4USpVDlG/AncXP3WbJLWpcxBEVtLA1B43qvUwI7
	nkrRNRRvPO2I53iHZtIV1gm0BOQgAqPeIwsro/1wblvU9VWWQEwQR0L65q+zstoiVIqymRAYs6Z
	T79dITl0wFL7HM9D7U8tAn6fqSEim3WqaF2RuKV66nLVU8pBTeXo5WeEwJFW9DCyEsp54af0pVK
	Dlk=
X-Received: by 2002:a05:600c:c082:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48e51dd3a1bmr55435145e9.0.1778086160424;
        Wed, 06 May 2026 09:49:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
Date: Wed,  6 May 2026 17:49:13 +0100
Message-ID: <20260506164914.3987293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0332A4DE4E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6473-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Correct a typo in the kernel-doc comment for struct
rtca3_ppb_per_cycle by fixing "adjutment" to "adjustment".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 8763745b9172..97e7e65f59a5 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -103,7 +103,7 @@ enum rtca3_alrm_set_step {
 
 /**
  * struct rtca3_ppb_per_cycle - PPB per cycle
- * @ten_sec: PPB per cycle in 10 seconds adjutment mode
+ * @ten_sec: PPB per cycle in 10 seconds adjustment mode
  * @sixty_sec: PPB per cycle in 60 seconds adjustment mode
  */
 struct rtca3_ppb_per_cycle {
-- 
2.54.0


