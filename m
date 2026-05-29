Return-Path: <linux-rtc+bounces-6589-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLDWNH1CGWqNuAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6589-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2026 09:38:37 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13D5FEA6A
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2026 09:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89B1F30E3D5A
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2026 07:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA99349AE0;
	Fri, 29 May 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnOc882U"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A97341050
	for <linux-rtc@vger.kernel.org>; Fri, 29 May 2026 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040004; cv=none; b=AtOEm2BAEy1p9EnZDwY+PvMV1xPeHcHneGUu8YoNYBKgOtpNtoAVNG4TxsDxnHHsfP6NwlCG9aKGiSIytgxVdV3khGRnDIM2bUVvue8rHTpfuwC9YRGwedI2cHXkh+NewKHQexeBhki95kBW5KZ2RKkzynzOmEBs8vB920zITdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040004; c=relaxed/simple;
	bh=C2UmvHg4pq3Kveuh7eyfvS0WF+OsmyQbD1WPj/oCZfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dF0ILDaR00gLxnw+/5GPs/cElMfWuX/OlmwXC2OW3hIXButnE/aT7V4GeIp99DXo8PN/mxKLVkQugjEsP6D8dYPnUcg+9ImHpA/wsgHsjWjz0rk3iyX2FbBeCZfmwSxpLwLNYrBGBUXsaNOmeykDzuOH/hq4Yo3tP0XbA2JJqdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnOc882U; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a4113ab355so8844331e87.1
        for <linux-rtc@vger.kernel.org>; Fri, 29 May 2026 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780040001; x=1780644801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLXzJTBxhRzNVcfTdOrnp8DxAIsKoO1FxDcS4XlJuFs=;
        b=VnOc882U2GUpjzR1ghxiJZKdLoi5M1jiMx+VpZnO+OVGUSU0ASGcCU7/hCpHNwKBhQ
         pfNInZglmC+wiy2xToqcI3uhnQBtr1K6Oiid2a840KjKKNHN6jHbgQ7Yj7d8xPJgz7XJ
         trE1H734BruHR2IJIAbPlY2E+SmIPKcOg0AtNRIbUIacU3rZgTn+oopx0IaO4/07wR4r
         ouHwOhHQePhxnUcLDptTjmalVIR7M7P8uC3r+O9ulbRGDaQGSttIDgQlpBYwJR9FdsUE
         Ql1bIi+7M5I3ahqrfqroWxYhIyZA5bLEDtpEpULTROOx66rZDDZtYuc6U/HgfjgBV0Gy
         5L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040001; x=1780644801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLXzJTBxhRzNVcfTdOrnp8DxAIsKoO1FxDcS4XlJuFs=;
        b=KA/ObIIVdYzlb0xpUSKGk439dHKmSEG1q0UmJC/KAfFNGLRPPWB0wZznY8/DMEDRwB
         fft+gkgYzRDw5yoC5oBKrVkT83jfpQ5g76mS8kGDRK0inogP9NsxGAiKuXIjRJIlNNV3
         IZGidH8kTbMb+tvmxq7EjvUYBfoaeoBFM9SheU0hFn97rVFuOJ4ZDim1xJCm/40G03pK
         ApvW4OJu8sSU6n6uJ+0G9uGvCfrEmJBQJ5ntFSWY68IpFQ0v3fqQ/cC5YlygF6N6XUyw
         eAnm44QML4CyE2uR9KbS9I39MIk+pzRK3SOF5CA2W6QdUYxcBWKMHpGv8aCYe0x/+BZh
         SQ/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8o3PBggsbOKfY3aEPtQ05phV+WjwBqUAfZe01uubaTELnBxL4jqtT9jk24HwHr6cFumlMNTAB2bQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxhOD0qLxdyygGlz+UArcbSgLMPC0Ir2d2mavD4bAAWo8Uc6Gf
	u53hrq+t88n5KgIypkUIpoUuSjfVsy7LNjsSrl9uZo7bT6JvRu9Sk9sW
X-Gm-Gg: Acq92OFgygdxhOVDz6tHhHuqrrEWlLklNRF2z7JUjqN3YNliJiLZC5Yo2h98E3UXXuX
	z8vMpAJKjlaUbJa9ON6aJmhb6aCzv4l77yoZ9+jyd3nW+C9+oVOjfAv80X3BbTWEYo8/GX++x4Z
	/BMrsM6OxN/nHkXXI8SHawJjpufTUVp/bdMSLQpBpWhCBsZDozeN6p0F4RyC2eprFDnYuVcofF4
	rkcuHEODJ9W5hjt/BnvM0TjYk6EpC5Nynx+J8DjCAE2XYkU6CTBo8sgWMNa74ZnjX5Kjo9IGsI+
	MqhVP2KTYXbVnni7S64F6t7wR0IhYmOjoEPxhV/IcUoJA99Rh1LGc2d5y2Zu2AIf+J8nR45Kh+6
	imhi4drPQNQsIzC3k9R5T0mYofbW5KIVh34Xbb2YrScVfkQHYUbGOYXuE8Ydq0fP6NZ0t2/ydGj
	R8SQ3eyppGQqp1Uxt1RnHWMhprwbG6xCxgiYwzOa6CMI/8gfCJVlPIOg==
X-Received: by 2002:a05:6512:b07:b0:5a8:97d7:8c2e with SMTP id 2adb3069b0e04-5aa594b424cmr494476e87.28.1780040000761;
        Fri, 29 May 2026 00:33:20 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b79f297sm92290e87.82.2026.05.29.00.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:33:19 -0700 (PDT)
Message-ID: <fca8dfd9-f377-44ef-bfdb-b7135f4d39c5@gmail.com>
Date: Fri, 29 May 2026 10:33:18 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] rtc: Use named initializers for platform_device_id
 arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Karel Balej <balejk@matfyz.cz>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
 <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-6589-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4F13D5FEA6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 28/05/2026 09:48, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub)<u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

