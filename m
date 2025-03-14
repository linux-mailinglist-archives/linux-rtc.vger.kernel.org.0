Return-Path: <linux-rtc+bounces-3487-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51722A60B12
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 09:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5203A4017
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 08:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF0E1A0706;
	Fri, 14 Mar 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SExaSyJH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A05519CC24;
	Fri, 14 Mar 2025 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940239; cv=none; b=me9a4K+v2FsPdDVQJCfs/szMEj5YRZdPAfcIvs4bRAc8HEP5KBH/UV+QW5H6+wouvqEZ7ew2S9MfJqf8MTG2K2/VYV2zX4BRijYjtt2X3v3JzhV2li3sjnYrZ59YL6FRZ9KuOLuuUe9etv7S1uPhhRvBsfIKFsEMRho3PDSeh9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940239; c=relaxed/simple;
	bh=FhM8haTH27eXiHrnuMgVwFYc5tZtWF+eW6pPbLzO0PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Um5Hg7DDXDaJo8mNNxNZRqC8Ed8K3Jbm1tOYLTpR0OOrGxpm9a7sM9DXiewtJKo6NumrPktLldeuu1AQINclykNDMrKkacgI5io1PqeJvZLOFYCKVO3CyXocZKNeCM6hPJcAF4UeofWpqVuq1Wg5CGV3BSc2PMsm5miWtCirj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SExaSyJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B326C4CEE3;
	Fri, 14 Mar 2025 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741940238;
	bh=FhM8haTH27eXiHrnuMgVwFYc5tZtWF+eW6pPbLzO0PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SExaSyJHOVRU229B1Is5QN4TX/Wdvp3CsN+cirTihtNymHZqgKHu00OjOyiGAO5n0
	 ptMzlGxzODZ+9NtGP2rPOEjik/CIUWX8RSjdQsX3rlXLf3+DrtOmRovMAYUDerHRl8
	 l/9qzkWgQxF0BsIVyp4IY6W9qAw0NKmyyKb26ZWtjYP9grN38FZA1JUK8BXvwk4bOH
	 ZJ/RNkcIAiKOsx+tl5fC7I26zjlYr7eAVvNx/SRfZ4RxUikxhg9n7lWPtzgnlL7yyx
	 BqSaWyapCKLOFtY73Qa2/2Z0hpltwql8M13mfaHHEkDinjbAO/n1oRFNJWEMpSXBzH
	 qT9k8gS3tpwIA==
Date: Fri, 14 Mar 2025 08:17:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] rtc: Avoid a couple of
 -Wflex-array-member-not-at-end warnings
Message-ID: <Z9PmC4lExxDMusf3@google.com>
References: <Z9N8BsVJF-s6Hcvd@kspp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9N8BsVJF-s6Hcvd@kspp>

On Fri, Mar 14, 2025 at 11:14:54AM +1030, Gustavo A. R. Silva wrote:
>  static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
>  			   u32 *response)
>  {
> +	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
> +			sizeof(struct ec_response_rtc));
>  	int ret;
> -	struct {
> -		struct cros_ec_command msg;
> -		struct ec_response_rtc data;
> -	} __packed msg;
>  
> -	memset(&msg, 0, sizeof(msg));
> -	msg.msg.command = command;
> -	msg.msg.insize = sizeof(msg.data);
> +	msg->command = command;
> +	msg->insize = sizeof(struct ec_response_rtc);
>  
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
> +	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
>  	if (ret < 0)
>  		return ret;
>  
> -	*response = msg.data.time;
> +	memcpy(response, msg->data, sizeof(*response));

Technically they are the same as `struct ec_response_rtc` only has an
u32 member.  Any reason to not translate it something similar to:

*response = ((struct ec_response_rtc *)msg->data)->time;

>  
>  	return 0;
>  }
> @@ -57,18 +54,15 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
>  static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
>  			   u32 param)
>  {
> +	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
> +			sizeof(struct ec_response_rtc));
>  	int ret;
> -	struct {
> -		struct cros_ec_command msg;
> -		struct ec_response_rtc data;
> -	} __packed msg;
>  
> -	memset(&msg, 0, sizeof(msg));
> -	msg.msg.command = command;
> -	msg.msg.outsize = sizeof(msg.data);
> -	msg.data.time = param;
> +	msg->command = command;
> +	msg->outsize = sizeof(struct ec_response_rtc);
> +	memcpy(msg->data, &param, sizeof(param));

Same here, how about:

((struct ec_response_rtc *)msg->data)->time = param;

