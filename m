Return-Path: <linux-rtc+bounces-2855-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69003A07BFC
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 16:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EB393A4562
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C684621D008;
	Thu,  9 Jan 2025 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RLVAkFfN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101821CFE2
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jan 2025 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436608; cv=none; b=KTztuys6cG0H0f+M9+3K/ekOOHoRFVkMCFuuHOO8uUuHNcpkd5aYS5sHFwuUP6HStj3/K/mJK3v1ScplKGopuGD9UYaAXYA1LsZshV5vtNQbel0njIRnaPfo33im+hzwbOMlCrGbwleK7RwYMBPJooe7DMDnz9VOegVIa0ZnrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436608; c=relaxed/simple;
	bh=pi3L0TZNyW+gb4rA9VnMXp8LC2gcMzm0O2i5QO+sp+g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dgsjk1mAr/ojWX4ZMXnWFAwEEPfG0SbDhwtNvhX4kFRYsve4gKAWZk1upK85L3NpgwpeEhAjeRipPJhSeaTHMvC3CQjyB194hv+6256Lpy0C6LspNv8PDd5oiicEOY2SobBGxJT+oRQEjDGh+8scGm9h/YUZmyECYXJh+1Wkjws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RLVAkFfN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso7122895e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jan 2025 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436603; x=1737041403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=;
        b=RLVAkFfNTPRzjdkxOTo+qrWrdrDHCpilcYK8MXahsZsrejw9eOSlx2OTSO4unDxg3c
         wEhxrdf0JG16IO4jDnPwGPEbkG9et06wsVM8w5nAQCeKUBzA0XVMbV1jIzj7vInPVEWs
         qGIriMDivxHRopU4f+hJSGTKSs0MQcKYpQATVgJHo4i1csWFXredb5RJZo/uSPh2v192
         IbddFOluILEEfajeibna/fGXPUGaVVAIZURljNcIcv+JCI+qrf5jXvbnt3iKG3Mn/mVa
         i10I6ypMsbvhzYXlp2f7H6UeKliyem7QhEFXeY0Ee+KwUbRNg2vZtlHIconzU9D0oEEc
         Tpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436603; x=1737041403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=;
        b=EunrMZKz3PAZMWbRUhnq4OJvt140xJeqga2JA2i1OmRDhn+Eq+AnBDbfx9OZIf7X1r
         d0cSFl+esBKjTN2tyG1rCMw105Zz9x6GOf+n0pfe7EHUags36kau+rHv2bDZgVt1lq1Y
         OsbpIUBzJoWHTH5EbBkd7Lp8lArIn+zYpPf5PRqwEX1+MK91DS1zQjF/wmcIMjkDcxMK
         WfZ47YO8kw2K8OzAjFR8LICR3g0NlkV2vZx/bauY7ZYqqUbOhZc+Xrlpmu9rpefig6Nw
         eYNv+QuWa3MOm9eaDFKyKBaxQrx60kUnbQ5YaCK0UH8MfiSdqz484IjkbrcOMZa5+8IJ
         ANCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPPLQVQB8F6Cf20V/fI0IN/fylB/Ma2fiWWIEWCyVHFC76YakbAUNPZR2y/395H4YU9NUL6q0S1v4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu3LaZ15jpyJOqz/fzHkwaZmbrE44MZqf869HWpECuUzuyAiak
	jPUnKbmtAEVw6dvyKoIolqX4DEMp6lONoOKDD4oiBPPcrNlPCTIFltFqIQqfFuQ=
X-Gm-Gg: ASbGnctp52d6bze916Ev/24FCZY51NbYPg5JuginKGUnWWmZZZjVDRcY6jwotuY7noA
	riA+gnm8CQx318AbUzHcbcUCwnsH5tO1nr6w3swiNFO1bzJCX7OXkPieBb2lQevDB93Y77nEYeQ
	ytpT83GgrBfwIIceluUpG6aPXL4YRHl9cAu+euPvatI7KND1mRN05JGe3dE/3mI7/kUQ+2EAJQU
	axamEYGjSPAawzGiSyGhl5kDVXsEeJxNRWtDLnW/wOmK2gmT2xkvfBWM/w=
X-Google-Smtp-Source: AGHT+IESEIosHxIgZW6pfGN37jB+1SZ6af3hY/XwSnu7UbwNBffzVz+YXNgg1d15dRMaOLI3zib2aw==
X-Received: by 2002:a05:600c:4e43:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-436e9d686f3mr23854545e9.1.1736436602912;
        Thu, 09 Jan 2025 07:30:02 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:02 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Enable RTC for the MT6357
Date: Thu, 09 Jan 2025 16:29:50 +0100
Message-Id: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7rf2cC/x2NQQqDMBAAvyJ77koSG6H9SvGwiZu6IGnZiAji3
 40eh2GYHQqrcIF3s4PyKkV+uYJ9NBAnyl9GGSuDM84ba17ImcLMqEvE4FJ6dp6SGz3UIFBhDEo
 5Tley9q3tUGN/ub9yku0efYbjOAEoLT/8eAAAAA==
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=606; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=pi3L0TZNyW+gb4rA9VnMXp8LC2gcMzm0O2i5QO+sp+g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t5/shO0hxQN8k02k2mkITZ69XbCGjT/miBkOuz
 GtM49VCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/reQAKCRArRkmdfjHURZp5D/
 0TaKWE8eyl/vEG7RaHLANL42Ymep1Hwe4a6NebC/W2NvNncoYaOY94DhnlFGHfg+2F7F2JJRVKxunq
 P12s2mr8NtBdYMPGdC2vAjzQ36YhUFIAHY4Tnxji6aW3UNvLKyF84vy2AGJhkx6nMKCNd0RPGkJiWl
 nqjkrKekSzCZwdDMS68tKAj+w2Y6YcUGV7LDuN0SdCmMMY8JWkseOOtYhAHqw0NcnYF6VayA886LoQ
 Q+Gw+tsP2CaXVOL3tyfywmrolG9ufPcsA4mpZTZBKCYf+zgfDfzB4AZ1s5P3on8rZhz1hnlltPT2yN
 NVcngc8oe9rEYaxXlFCx8vCwJYCh9OOBaCyd5b+H1ptFQZzbMS20MnAer0cF+F69x69cadrfqoTv01
 i5JwxVO1kercx1a8A4DM18shkyhzUV01fOl+lpmCZ869cVnhNiQ5BBhifI6aq70CqCunidVO1CMQsu
 sLlW1gKWZveod4lkQcy/449bn6mjzw+wgNhfjFc+8PqfcHJbqhd7NqskaQGEVClfPAxSELllcUp0vl
 yiYiPqzZWKfybXWt3JkCAuaMhfxnSYPieu2Ib9IAV2BjhwIOWOOeZfEIMe8n6ta7/RIT5kPFBI7GWS
 6LG1rSv2KDsQ8b67cSa5b/5zd8NTVfJwu8nNyQ3EVVHGX01oRs9+yuWkPLhA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

MT6357 PMIC's RTC use can use the MT6397 drivers with the MT6358 data.
Also, since kernel 6.6, a regression has been observed. The changes
responsible for the regression have been reverted.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      rtc: mt6359: add mt6357 support
      rtc: mt6359: fix year issue

 drivers/rtc/rtc-mt6397.c | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


