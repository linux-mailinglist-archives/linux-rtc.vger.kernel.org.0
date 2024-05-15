Return-Path: <linux-rtc+bounces-1185-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC18C6A4B
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2024 18:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 682C72812B9
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2024 16:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2A915624D;
	Wed, 15 May 2024 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K5Ctx+8x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B65313EFE5
	for <linux-rtc@vger.kernel.org>; Wed, 15 May 2024 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715789511; cv=none; b=LzqIgbp7/vVhBXToPlBiFWliAzIKS/CF9ANCvbqP4FaaK22n/2iFmNTdxjwuBfLWh2Wk8LNrK6mf1nYTIfLWdWjo8LJXHD66hP0P95DFxGl0huB4aYgK00S5ERUYMz+RTWhfp8xzb20MWYbuP5A+GX6uYSG+Uk18Ujk+GarahzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715789511; c=relaxed/simple;
	bh=VyPo9EZPTWGia1hDWfa6Ul+IiF/Q/cUsbeyb7RAuis8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=mOjH6MmIwUnguXm1Dgx0lNQnF2vgRL+HWzAAt7gwruSPaIrV7kjUR2LqXTWtbp6Im0lARtryyntZ100TILCc4O1gZjz5jN5O8OmikS6Q8YipwuNgijBdiWy8qFIYafDlCXPrAgNc6OpJisElWYv9mMJeBZ5c7nyQ+qyStMl4bGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K5Ctx+8x; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e0a34b2899so106503481fa.3
        for <linux-rtc@vger.kernel.org>; Wed, 15 May 2024 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715789507; x=1716394307; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyPo9EZPTWGia1hDWfa6Ul+IiF/Q/cUsbeyb7RAuis8=;
        b=K5Ctx+8x4uvQ2QwXesTElorxXh6gOyfLi5lEemyUsuE/NIgjfcJjTUvFPOA8INWbcM
         TVeR2VZYNayfpJFGXHqH2eLYg5bNJbvw2dr6GFniXH8T5Z9o5mo44i6vetOIPA+PIe1+
         3CQP3vkXu46p35nxxa1umRBTnZ5+XbCpCg94Lz5mWKWsIs/23ZW9qy+ApeUpRQgxOTaJ
         DQcHl5+/WCZ6b/4CtHl41SjkQ8OCy3HpiR07h3dEQ0JET8snLv5J//TsPNPNySymJ0A0
         fv2qXBoRtax4M2duMRzx7cRpMQjTjVRT5T1liTDfKuciS3IYC8udHw6Hjd+dr4sY14qM
         R9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715789507; x=1716394307;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VyPo9EZPTWGia1hDWfa6Ul+IiF/Q/cUsbeyb7RAuis8=;
        b=orxFQdju8XCUsGMY5c1hlI8P+zSOwp0KzWNYvx5Wc1QeXNQeUDkReffIp4UU49j/8G
         Veyf0Hl3T1cmSvia5nP4KRVqQxydAxDo30Ie1KhozDPg39h7Eker3hc5ZKisPZ5uBvUp
         qX4SkUk8kkCbIAZDDAT0uY/HCbaLO+Dt/KwrOvHBC0utqI1RnQLwuJoz/W3pgBIrb5p3
         +ZiWF6ylCbk2nKPEAPZlCRA4Tjaa69sUWZNIN3/U6Abg+5WF9RvA7R33qHdNWZo4Wc1r
         vaFHqO4qiaAJgFDO8yuEKs4MmiJQrGlFpPYnZ+uNOoq4jtKCY8ehs8IIoADcLBV9J6si
         gmCA==
X-Forwarded-Encrypted: i=1; AJvYcCXj17mvtH45NNZGo/sh7zuahgJlYAh3/v6A57QIlPDNiTWHXEPjnD9L8lfmgLsSBHSLTyQDfTbIjShULr/uzkSthR41dzKslR4m
X-Gm-Message-State: AOJu0YyJgyFYDqhWBdLNOSJSPRFeFhDrIQT0XNPIPOMQfkSYbtmqx/5n
	6P5Q0/VtBkf+DBvFEAAxYzeUDspcQ3mWR1/FIo3j6aubHjr5nw4zKDUhcFaQcBZUmdud8RyTAl1
	9
X-Google-Smtp-Source: AGHT+IEj/uLKh1PeNOsv2M6njD+iG6o754ZO04BrFMM5ikkzxMn6kpsym7eV05B7aFuyIhLBxeAXKA==
X-Received: by 2002:a2e:7c0d:0:b0:2e3:7121:aba6 with SMTP id 38308e7fff4ca-2e5205c61a3mr134524761fa.46.1715789506504;
        Wed, 15 May 2024 09:11:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:448:76e0:599c:db2f:fac4:6e1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4201088fe8csm157460515e9.32.2024.05.15.09.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 09:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 May 2024 18:11:45 +0200
Message-Id: <D1ACM943BLGZ.1YOGPZ48VVL6V@baylibre.com>
From: "Esteban Blanc" <eblanc@baylibre.com>
To: "Richard Genoud" <richard.genoud@bootlin.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Udit Kumar"
 <u-kumar1@ti.com>, "Thomas Richard" <thomas.richard@bootlin.com>, "Gregory
 CLEMENT" <gregory.clement@bootlin.com>, <linux-rtc@vger.kernel.org>, "Lee
 Jones" <lee@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] rtc: tps6594: Add power management support
X-Mailer: aerc 0.15.2
References: <20240515152827.80185-1-richard.genoud@bootlin.com>
 <20240515152827.80185-2-richard.genoud@bootlin.com>
In-Reply-To: <20240515152827.80185-2-richard.genoud@bootlin.com>

Hi Richard,

This looks good to me.

Reviewed-by: Esteban Blanc <eblanc@baylibre.com>

Best regards,

--=20
Esteban "Skallwar" Blanc
BayLibre

