Return-Path: <linux-rtc+bounces-4862-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29732B532D9
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 14:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBF8C7A226D
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB36731DDB9;
	Thu, 11 Sep 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH3o1mxo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC1321C19D;
	Thu, 11 Sep 2025 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595392; cv=none; b=cZA/Mdbw2mU8svf0MNJw9sq65cEdEubOEpTh6Jv74VquwwSQbv8cTeJwanAPlc6e+fVesBhABolDN7Rw4JScFNkrIoF3J5Cg7MuAjg7D3iJCdDaCSYz/5Q/3/kol0DGf1X7sdUznAW0VNrnEF2M49OD3WiqFsd5qytzyITziG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595392; c=relaxed/simple;
	bh=ce8UH9xZQsQDBuxHmQrBcH6BNIguzBQGt3f8Gl5L25w=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=S/6owsAno6mHgT1gpnD3ubEzuxe6P/r1JenVbs9Yz+Oejw671Au2WaCsIfD0w0LoaXXiNNsL2t0hIiTKjyN4FSVikCpW7m4LMGlSTHGODrwes3xtzjslHx2nYxnCnJftshuMAI8rA5bTtIQfS/7FJqA29OhYMXd3sdjFkx3vzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH3o1mxo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso11305675e9.0;
        Thu, 11 Sep 2025 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757595389; x=1758200189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce8UH9xZQsQDBuxHmQrBcH6BNIguzBQGt3f8Gl5L25w=;
        b=GH3o1mxoprZJK+5d3WH+D2NihKJk3ciPcZ4OVmB80f9YxyOVwBt+wrPqDtGcnSVg+f
         4Ms9lTYJeCMPTxtg/7VC+rsc7B2aW1Y1kFCwscxzi3OWuhivA3+guRTKlw7hkwGN9CQa
         +WCIhP0iYVc3+ErHi164kSFgDIJD+esjkkD7jcpxyM3NvXGRW/fZyjGy1mYisbMtxfpc
         ofCwL3M46oj0Zg98ucOiIE9eaBO05uTtncJ19zRoYgDL7Rc7ZTBE/Hku3/T3uGGVhaal
         NGBuWU8MCf56SRkl3vZw3tGXouquagSJoHOx3I4FBL+94fYgBMuXfiAGcUkZmCXgjZee
         sPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595389; x=1758200189;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ce8UH9xZQsQDBuxHmQrBcH6BNIguzBQGt3f8Gl5L25w=;
        b=uOdua1iIylmPl291AcOqoxJrXyP6uJpU+swD1XAfS0oceKajTrTDkP44H5n0ZgNGQB
         Ar0GkmkrKjYgYu4YtE181OpZSYEQ/RudopOAjrvZsPlILwhQ9SOrJRbesyyW62x9Forg
         erpVQ13CMdnndlfdVazIfciHPWsIfqMjVpH4gCDtLfg5zVTwWu4cIAMYgprHetRSG4L0
         jGGKMJMK+ioZxFUP+UH9MNsVH0gB+2SMhkb90DkQwJzldE+Cz8BwdeBe0r5PVFkDKBLV
         ZL1vJRCWqv45VCwOjGXlCFkTwVj6wHX+D+k5M4x7XVu4Q+WFvrbnPuI29bkvnUda9AxL
         YlLw==
X-Forwarded-Encrypted: i=1; AJvYcCWu2VH3qJrYkr8hFxC/ZfAgOmzW2i1aM7D3y1KKnkqDemAow0q6TaZ1KP1YLgnyNI1H16globUySq5Y@vger.kernel.org, AJvYcCXSeYDNk6MzkuiTiHxZoM5XrGFC5uUjTPkwmMrasg00VMaOonthSX81H3bwQEZVeWmPnd3sYA7bL0ssCIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQx5F+k7NOJUV9KrXqNU/e9/RsxNXhhtW8PjkmVLuCyd4TA6rh
	sQ550Yv3eoA/cESEokPlRvXUJNcF+BOgA/t0dXGMeh6T7cK0qOJ9FRu2
X-Gm-Gg: ASbGncvPjQs9bd98ixyIwyYW+B3/BvkPQpg6/4dea0pL2HQnXItdQf/LjZfojsarou1
	Ld09wqW+P+k9fQhr/zrUtbneXT7jXHyi/C26tnHSvx8ZjDHISEez2oJrPsYL6vmFIqzqQKRZfGN
	nz8RPpBClBsIEX1zROqhza5zU1kiIZY4JHyQVRu2hmJAks6zeshlzXK/EMfmGZwE1HO+5whlpth
	vMwqy7oSjxnkQWJ6zjcoo4pUWZucgG3z6xlJ/BTCtv/xBNmrzi1d3iHSC6SR55X+StFI2cj6qNu
	O+hdbH5gZeGzSYux/KzXlYxHfAD0QvW3ZwRLwPSU7HMrjPuBbUPalDyWPl3C0eukBlD7S7YaBp9
	McJRrzV3LZXcjpWUO7fwUrkhbmNmz1yHD6LcK44SRrPmZZHjEx4eD+st3xJPUScKr4fXg5cBUvJ
	1F5QBlvzhcdy684egUIEkT/Xu/DIYWd6Z8oMgmCCnVlRqMvssRYYu2RGFdBd5AZXMyzAea+wk=
X-Google-Smtp-Source: AGHT+IFd+GCWrLn2ujqAcPRacnWftjVPvh+sxHReXxHQop38Kqrl9k82JOvLS22t3q8TwpvT0Ug5lg==
X-Received: by 2002:a5d:5d0e:0:b0:3cf:3f1:acd8 with SMTP id ffacd0b85a97d-3e75e10651amr4189316f8f.28.1757595389096;
        Thu, 11 Sep 2025 05:56:29 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7130:c664:5cf3:46ff:1e0c:dcb9? (2a02-8440-7130-c664-5cf3-46ff-1e0c-dcb9.rev.sfr.net. [2a02:8440:7130:c664:5cf3:46ff:1e0c:dcb9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76077584esm2449756f8f.11.2025.09.11.05.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 05:56:28 -0700 (PDT)
Message-ID: <f3b07ccf-5b9f-4829-9281-56f02985ef4a@gmail.com>
Date: Thu, 11 Sep 2025 14:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: clement.legoffic@foss.st.com
Cc: alexandre.belloni@bootlin.com, clement.leger@bootlin.com,
 jens.wiklander@linaro.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
Subject: Re: [PATCH 0/3] Add alarm operation to the rtc-optee driver
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clemlegoffic@gmail.com>
In-Reply-To: <20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Anyone to review this series ?
I used the mailto:link from the lore.kernel website here:
https://lore.kernel.org/all/20250715-upstream-optee-rtc-v1-0-e0fdf8aae545@foss.st.com/
Let me know if the series needs a resend.

Best regards,
Clément

