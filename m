Return-Path: <linux-rtc+bounces-4011-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CBA9EE6E
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 12:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D28189F64D
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 10:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BFF19047F;
	Mon, 28 Apr 2025 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O6kLFuOe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CE125F7AA
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837745; cv=none; b=ttMPuYW6y3J8UErYUHnHr7xri1DamV8J5NegGrUxw9TrIGuLL9StJ0KpuUgBOo1x8mQWrlTrJtmIein83EC+p0UCvHRV7UlpfYyZ22hD+7Lt+fyi+5T31rdUMPetFfH/BZY4IVWhojUICqLFvsLwl9l+n2MmaXEK29gA1zIxNHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837745; c=relaxed/simple;
	bh=Wey50fUT5Nf8jtt0fFzgyeoJOVVmx+3Cfd5R2oIoURI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+ffnFuwkP/lLJ/Ki9D2vKIHebXjH8ZtoKIhTCURqDg2kMGDQAxLOT8QvKFmZGbr+EQ/7m9wqor0VRanGTMGQHxXlHlzmPsqMyLiiDP1vuSpLPBtyVg7loKa+RTsgM3CN+YM30Y2DFPCjcOHz2N/nf/Lo7ugYC7/k8DDu0ZfJSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O6kLFuOe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2294498f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 03:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745837741; x=1746442541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFN7Y9ajG7mv/bsFcbVbsJZjkflbAhC0QhrNhHTmMUI=;
        b=O6kLFuOeMyBeMlK9UpORuPrjcOw9Qq6UlkxhUN6yjLFPrp7QJg45iDvr2lvmsAJwGz
         135jWC4vHYEDmaDVt4dGxCov3EzQpdbh6VWdoveoNHsSGiMqdYovn/oZJUWc2zp2I0rR
         gRfgfd3vUjycLkPrDeRhy9RGC1t8ONOXaBkxY8I+1GRkwOhNqsc2P6pLv2uDpf6Ch/GU
         2y19F81nHbotQT4RDzU62BZR0aKGr7RaX6i8VrFOg7dPTzM7TtmZB5mlPlDUJHhzLtMT
         8aa8MAvGA0XgyB4AcXm7EywnKj+BYSf9MzMP8lccHJWVyA7w1vonqhVNM+XHRBr7yegg
         ZC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837741; x=1746442541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFN7Y9ajG7mv/bsFcbVbsJZjkflbAhC0QhrNhHTmMUI=;
        b=BEyUaJFGgNlzrcnJIJoexJI7AM84tu4w3DRIGXf+AUx4I1rdrQRHuxU7kb0FqJraJ/
         PkKsW4cxqVuBL08nkeWYUD14yk/hR1hRnNIxc3ooe7MMdkx9Js3DcP1TJFxwUaqe//s5
         T+NHIjvBYGyWb0dLbXSK0c5hL7RDrs9P3YPecxnkdgCmb4SCMDVEVqYCxxVjliMua7mT
         hONZriQqXpORISkM/b3JCAFp8c2X2E8reRKJTQPdMAJNdwIkDqEsKZNQQkEamepxpvg8
         1Bu6d+FGGsfo3K9W5OuExuEgSmog/1wUqdtpf9jGrZ40i4HdObGPim0MEvL9ja1pTxc6
         FUsg==
X-Gm-Message-State: AOJu0Yykml1H3ZFQ5VUKqipl/K28WcLSHSKYjN5Su7dUgzUZ8r6G4BWH
	u/A4dYnJxFCXLZUoNw4YlOytCDTF2HEOxChOMLsPDiLtqAdLFr+TfU0rgeoMz7s=
X-Gm-Gg: ASbGncuy88Aq2jQjJkT8TzuOmZKJDLnk3k3gz9i/+wkarm2o8Qk7saX1kgipum4EMV6
	wo+SLPz6lJJ/WYSSvm6LbWjGhVWxZGZAcpxDKax/KxReiT5ty1fWAUuJwAZHOCIIfdECBYL3V74
	er3N8p2Ftvq+fY4s75bvuWvLWABpjQGRdNYi7793jEGI8DymOgi5HsqJJQHs/ok7IwZZYdX2WiX
	346HbBWlCw/sXXfyVnaB2IsDqSJswI9MV34b8PDbz3DEJJ8a7fs8PKkP6vBk6EM9oD+uWcumUfw
	SeE8XD8VA/4x0123m+psRYdqJMm6S8fHXGHc6q8KQOVetPgcMwUw7kPzRq4qI2OEsAzywkozP+Y
	SxbDg
X-Google-Smtp-Source: AGHT+IEuL50Qb91w0VnQIGYw2e2ACPF850zzX/DeAKCpElcbElEkW0pFf9mYkjOQNgyB0LDalxJ54Q==
X-Received: by 2002:a05:6000:400e:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a07aa66708mr5765250f8f.19.1745837741235;
        Mon, 28 Apr 2025 03:55:41 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm10907013f8f.32.2025.04.28.03.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 03:55:40 -0700 (PDT)
Message-ID: <4f5bb188-1232-4642-ab7b-d985192f5085@baylibre.com>
Date: Mon, 28 Apr 2025 12:55:39 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Fix pre-1970 date handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Angelo,

I failed to Cc: you for this new revision because it doesn't touch the mtk rtc driver any more. 
Still you might be interested as it fixes the issues for this driver. I'm looking forward to feedback.

On 28/04/2025 12:06, Alexandre Mergnat wrote:
> This series fixes pre-1970 date handling in the RTC subsystem. The changes
> are particularly important for MediaTek platforms using the rtc-mt6397
> driver, which can only store dates from 1900-01-01 to 2027-12-31.
> 
> The handling of pre-1970 dates in time conversion functions is improved, which
> is essential for hardware that must reuse earlier dates once their native format
> limits are reached. Sign-related comparison issues causing incorrect offset
> calculations are fixed, and the test infrastructure is enhanced to validate time
> conversions across the entire date range.
> 
> These improvements ensure the RTC subsystem functions correctly when hardware
> date limits are reached, particularly relevant as the rtc-mt6397 driver will
> hit its upper limit in less than three years.
> 
> ---
> Changes in v4:
> - Remove "rtc: mt6359: Add mt6357 support" to send it in another serie.
> - Change title serie to "Fix pre-1970 date handling " because MT6357
>    support is no more related to this.
> - Remove "arm64: dts: mediatek: Set RTC start year property" because it
>    is not requiered to have MTK RTC working.
> - Remove "rtc: mt6397: Remove start time parameters".
> - Rework time comparison fix to avoid cast.
> - Remove change in rtc_valid_tm.
> - Improve rtc_time64_to_tm change for readability and efficiency.
> - Extend conversion test cover to reach 1900 year value.
> - Link to v3: https://lore.kernel.org/r/20250109-enable-rtc-v3-0-f003e8144419@baylibre.com
> 
> Changes in v3:
> - Rebase on top of rtc-6.15
> - Added explicit start-year property in DTSIs for MT6357, MT6358, and
>    MT6359 PMIC RTCs to ensure consistent values between hardware
>    registers and the RTC framework.
> - Removed hardcoded offset and start_secs parameter in mt6397 driver
>    in favor of using the DTS start-year property.
> - Fixed type comparison issues between signed time64_t and unsigned
>    range values to correctly handle dates before 1970.
> - Added proper handling of negative time values (pre-1970 dates) in
>    time conversion functions.
> - Modified rtc_time64_to_tm() to correctly handle negative timestamp
>    values.
> - Removed the tm_year < 70 restriction in rtc_valid_tm() to allow
>    pre-1970 dates to be validated correctly .
> - Link to v2: https://lore.kernel.org/all/20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com/
> 
> Changes in v2:
> - Split the patch to have:
>    - Add MT6357 support
>    - Fix hwclock issue
> - Handle the year offset in another way, but the V1 way still viable.
> - Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com
> 
> ---
> Alexandre Mergnat (2):
>        rtc: Make rtc_time64_to_tm() support dates before 1970
>        rtc: Fix offset calculation for .start_secs < 0
> 
> Uwe Kleine-König (3):
>        rtc: test: Emit the seconds-since-1970 value instead of days-since-1970
>        rtc: test: Also test time and wday outcome of rtc_time64_to_tm()
>        rtc: test: Test date conversion for dates starting in 1900
> 
>   drivers/rtc/class.c    |  2 +-
>   drivers/rtc/lib.c      | 24 +++++++++++++++++++-----
>   drivers/rtc/lib_test.c | 27 ++++++++++++++++-----------
>   3 files changed, 36 insertions(+), 17 deletions(-)
> ---
> base-commit: 424dfcd441f035769890e6d1faec2081458627b9
> change-id: 20250109-enable-rtc-b2ff435af2d5
> 
> Best regards,

-- 
Regards,
Alexandre

