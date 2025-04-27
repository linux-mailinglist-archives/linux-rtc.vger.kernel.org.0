Return-Path: <linux-rtc+bounces-4002-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9569A9E354
	for <lists+linux-rtc@lfdr.de>; Sun, 27 Apr 2025 15:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF6217C19A
	for <lists+linux-rtc@lfdr.de>; Sun, 27 Apr 2025 13:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6E318FC92;
	Sun, 27 Apr 2025 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FU5NM75h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C5F1531DB
	for <linux-rtc@vger.kernel.org>; Sun, 27 Apr 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745761281; cv=none; b=K3R2XRWDUIv0ix7BzRBYjorr4YnA10cAuw3fmoF18Wq0UsuGIHBhQhIBf5kvfs1M7MW8f8mj7+IIZgY8+KXilrVWegt3AAxZqw8giB6uIAHUlw7FC2VMnMgcl0W7CbUtC5CqWFiUwZljKO5+PUlk+rVIT+hJk5Yeg8ibnzybclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745761281; c=relaxed/simple;
	bh=VnALKFAe0qO+P//pjggZT55wiJFa5E0L8cO8PSW+xlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTtmzS4GSSXT/erCApAtQtY04BSpGvURyNAPKuBEZn/zdiyJM1KC9IbUgy1kpjbQXcD79XRuwpiSRUiZti/3SNPU4UDlFSm3+FfQjEoXx4fETrHyy9M3DWH+sXCeonNyhyx3jeloujyH4t0HRT/UPuUcamKRfla/lthWryWPbjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FU5NM75h; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso7292621a12.2
        for <linux-rtc@vger.kernel.org>; Sun, 27 Apr 2025 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745761277; x=1746366077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgLsTHFUHPVY+MlDYOlPHI/6Yw7FnfxYmbCzXZmnW0Y=;
        b=FU5NM75hacbjTf/WjGAOYbr9cn1stb2HOpic2Du6PWnwncKLp4aPXdkPF5KjMGhbrX
         Gvr8s5MvTxKirq5OrANmVJVHWfPJF3pppY011xlYp8aaePN09xwPUpWERsnzZguHh/AE
         QISf2GAd4yJheDVooxIwgFB9NEW5Qx+4zweppybxiqpLfVyVcHJzDHoR2RZ6x6nlTORK
         sTXDO7JYfxh9j74YH/QOisoVzdfJtITcdcmRx4EzdSvVVWjJP3i4ZOP7R/ef8TMzIF/P
         tfQmsFETVTgFd9T15EHe6wPw30596qui0O+H9Uyc3BBeV/TWzZh1e6xz6SM+iauBG2Ie
         UXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745761277; x=1746366077;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgLsTHFUHPVY+MlDYOlPHI/6Yw7FnfxYmbCzXZmnW0Y=;
        b=VCw1Us5K0DjSWrZ4PJO8mE5FS5TzayYTg5QMJq40aoh05iVn6+8sd1+dMx42zIlD6Z
         s0n0AJgKXxYT9ZgWQJkcUcyoQDWsgWqP+rZqtNEZvnISLiPfHN2RVkGnDphFxTNlyneA
         2h1HBeSHALqiIBtkWKhsYN+nfHlkfF9o+7QWSY9XMDxJKJMw5u4UcZVDcbLwTQ1ryaq1
         RXxxPm2BLtVMY3n6z2/ybxqqaW0GMaQYyWZEwQVUGJeelaMw//IhIw52spjJuBSbPFGW
         v+hmb4rBkBRCA+ykB5RVvH5Nf3aIrrquFq186BJgldPXXvIXbk1wrhmbrTj1PNC0uB8z
         sAjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbLliRzJ2xbVOMrm5MOz/fujKk65/RSvEMH0WRddW/JVzY+1fmeXUIwRF3BcdqYRAhDBiPdpDKamI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8id/hrcoKbGgpKi/8T9qSgVXNETn367HUH273fJrvjPcVc5a
	/OK0SgbPk7bvt4/iiYi++jTWf9X2GFih16pw29i32LCChYqclnUQ3TIpnYOpMSI=
X-Gm-Gg: ASbGncvcMbjK1vPhuvgkrE865hCbbRSN501yULTeR5LUB8+8TFUa23MT3GNDLvhrLiN
	RScOvZPZvGM3UlkHXHaadXMU7bH1RhF4z7FNHP6PNifdau1F8aKN2EpGWPulkuFoikkrkOyc3vl
	WmYsH1m22uR5zFVzx1AI06lpnx7PfPrsR1CoYN3Gd7duBlPAK9ThvOi9R+QDV7hsZ7wLNkjrQ2M
	M2l/HE4rND0f7xos+8ZRBVXrgt38sEVLz/VP3EKIraB5Lcoi72NpZahu2D92AVh0NIRB9vTupda
	XpPEHQPWJFANmD+ru0fIKZj1MrYslPRITNyBR09xFLQt60sRAasB3JZbsAOS
X-Google-Smtp-Source: AGHT+IFjvYNUHCZ3dPrDRyEa/OPDZMNfSszUTn/p2tnOnx4im+io+5tXp8qpQenDsLlwqL9uw5wHmg==
X-Received: by 2002:a05:6402:2691:b0:5e7:c773:ae35 with SMTP id 4fb4d7f45d1cf-5f722672b22mr7593685a12.5.1745761277306;
        Sun, 27 Apr 2025 06:41:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff570sm4139225a12.23.2025.04.27.06.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 06:41:15 -0700 (PDT)
Message-ID: <86068277-5443-435d-b1cb-0d1a5731b331@tuxon.dev>
Date: Sun, 27 Apr 2025 16:41:14 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/11] Enable Power Modes Support for SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.04.2025 00:41, Ryan.Wanner@microchip.com wrote:
>   ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
>   ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65
>     SoC
>   ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

Applied to at91-dt, thanks!

