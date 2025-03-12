Return-Path: <linux-rtc+bounces-3470-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E486A5D56D
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 06:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FFF5189245C
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 05:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E121B6CFE;
	Wed, 12 Mar 2025 05:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th7XfJRi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEA4645;
	Wed, 12 Mar 2025 05:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741756683; cv=none; b=YgTysjoI3Zp0Kjyfn50ApcmpjmhGuFHBabyrutrpxCRA7AlPTli9GEBBGkzucpOzw2uDUj7GpJhjNxzM0QebW8FBhlykKv1Ku8PV7kfkFCtubgpBJMD9/pbdtH6cEO8B785MSujSDA8/3xxjhMJCoUQ7p20ZX3XYTkRF+HMdUXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741756683; c=relaxed/simple;
	bh=6zEfkQJTeCoVS1ITY6NC3OkHfYRDmhUdLUjFwUaqvqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWe9onEgkpDWc6NsELRvsyeNvqbsz5fPcxvNjeAwVZf6liRpPb/3BAt6XX9yR2z5UNFb7vrTwLXL5cjQiUoymputG1Go9mYaPvZqpX9FKsTTx28wD3MQm4b6XNVidEVPVSmqPKPZTO102je9dQHyghsT87cQ5BRSQuDb3x+gktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th7XfJRi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CF5C4CEE3;
	Wed, 12 Mar 2025 05:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741756682;
	bh=6zEfkQJTeCoVS1ITY6NC3OkHfYRDmhUdLUjFwUaqvqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Th7XfJRiPLCwO5HkmFbZrbRwJQjxnWG0hh4A9EHDiNjKbP3o8hBFFz4M1NZaQZzOH
	 YEnGVHEK6Q7+t3Zcpj6o6pfUm2Yl5IgcAYG2Emp/6Jd6Lugllh8OgDiJ35fu/wqUVi
	 QQv8mxxdiv9xvCMndwoE1SCRA3HLQCv4TnWjFvqlti+fy7lYvk7NAAV421zLYVZBmy
	 t363Yl+rPI22/MXFb5zRkL1IJHFakEkc5HJcwmnbtsk2ywuCZYvQAr+PMtEwz5kq8D
	 CC7Hvc4nPgnFDX95fWOqerf189CvhX2FP6EHOwtBjUWvM7OjD1OZd8AD0EWNtk9l5Y
	 yrWvNWx8eza9w==
Date: Wed, 12 Mar 2025 05:17:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [RFC] rtc: Avoid a couple of -Wflex-array-member-not-at-end
 warnings
Message-ID: <Z9EZByipsNmBoVea@google.com>
References: <Z851qvkycepdNlBd@kspp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z851qvkycepdNlBd@kspp>

On Mon, Mar 10, 2025 at 03:46:26PM +1030, Gustavo A. R. Silva wrote:
> Hi all,
> 
> As part of the efforts to globally enable -Wflex-array-member-not-at-end,
> I'm currently trying to fix the following warnings:
> 
> drivers/rtc/rtc-cros-ec.c:62:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rtc/rtc-cros-ec.c:40:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> The issue is that `struct cros_ec_command` is a flexible structure (which
> means that it contains a flexible-array member), and there is an object
> of this type (msg) declared within another structure but at the end.
                                                          ^ not

> It seems that the following patch would suffice, as long as the flex-array
> member in `struct cros_ec_command` is not expected to be accessed and
> overlap with `struct ec_response_rtc data` in a "controlled manner":
> 
> diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
> index 865c2e82c7a5..7e9bbab47e4c 100644
> --- a/drivers/rtc/rtc-cros-ec.c
> +++ b/drivers/rtc/rtc-cros-ec.c
> @@ -37,8 +37,8 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
>  {
>         int ret;
>         struct {
> -               struct cros_ec_command msg;
>                 struct ec_response_rtc data;
> +               struct cros_ec_command msg;
>         } __packed msg;
>  
>         memset(&msg, 0, sizeof(msg));
> @@ -59,8 +59,8 @@ static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
>  {
>         int ret;
>         struct {
> -               struct cros_ec_command msg;
>                 struct ec_response_rtc data;
> +               struct cros_ec_command msg;
>         } __packed msg;
>  
>         memset(&msg, 0, sizeof(msg));

This doesn't work.  The header (i.e. struct cros_ec_command) is expected to
allocate right before the payload (e.g. struct ec_response_rtc)[1][2].

[1]: https://elixir.bootlin.com/linux/v6.14-rc1/source/drivers/platform/chrome/cros_ec_proto.c#L82
[2]: https://elixir.bootlin.com/linux/v6.14-rc1/source/drivers/platform/chrome/cros_ec_i2c.c#L166

> Otherwise, we probably need to use struct_group_tagged() as follows:

I'm not a big fan of the solution.  How about using something similar to:

struct cros_ec_command *msg = kzalloc(sizeof(*msg) +
                                      sizeof(struct ec_response_rtc), ...);


