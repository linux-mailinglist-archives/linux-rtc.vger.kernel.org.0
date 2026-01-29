Return-Path: <linux-rtc+bounces-5913-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNqgJ5SGe2lOFQIAu9opvQ
	(envelope-from <linux-rtc+bounces-5913-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 17:11:00 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A00B1E2F
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 17:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2F873038506
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 16:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626183161A3;
	Thu, 29 Jan 2026 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mNSQY84L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BA32ED25
	for <linux-rtc@vger.kernel.org>; Thu, 29 Jan 2026 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702737; cv=none; b=cE/3ymiatwNUxdg3k3j2mbY+zWU2hpw7CA1bf2EL1rVgh+xzKmdMYYbSkJpvRKRwM3AV1Y770C+JW0bA04yvo4CsLTY9BS6NwJiGbj7g/Kh+uk0VV2GKt+2k9NsetPi5f/AlVFtHq/DtmlbetqrTvqgqHO0lATKGYUk/FUTJjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702737; c=relaxed/simple;
	bh=yVdibtwtGBdtM6zRoTTns3ysNbJg04ECgBNHy8kebSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnuZXbnQdypQAsgof/qMSu+GZroigSeF9UgDgd3PT530+tTO8wJ31f+YwW/Mgi37thJCJ4fREWpZa0lkqka0Xn6dEDC0R9JoGmUqh5qmFYR+kMeRyyVuuLghYDXWHtR0+bv0CG7e6lX343R+Id/mkf4aAMqaLOQWwH9gSPS7KVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mNSQY84L; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 850394E42320;
	Thu, 29 Jan 2026 16:05:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FCDF60746;
	Thu, 29 Jan 2026 16:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C84C6119A8095;
	Thu, 29 Jan 2026 17:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769702731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Lc6wWk4IgTT559wWGEQNQjCDMW6utgy5FoBxVvSG2KM=;
	b=mNSQY84LQ52ZnscGD18IByJvZJQQIacVebk2t/plG/whMwn+83Zl1E9OvoWX2V2RxCfoxS
	J7FKlupj1VB7e6rJFirr6RfK/Oy8A6bsRNzcw474UsjN/FbndmiovBhMgwm4YRKoBwKFmx
	3ZeTXY3A03ZQLaJOCIiO8R9mHEDa7oyn4WPEqgrGwV6YrglWUK6/soN5WeE49FI13rIEZA
	q4eMBtWPKykfEWe2ps7aGWr4/JW4mG1Uq3VhlwwNdXdiVcqnGgeBHoWH5R9jClm0TjLX7V
	OKWIWCnc7iGZ2Eb/+sESPRrxzaJ8ZnvdKXHvmTHen/Ais5igGxDQBGU8jw1rrw==
Date: Thu, 29 Jan 2026 17:05:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: rouven.czerwinski@linaro.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: optee: simplify OP-TEE context match
Message-ID: <202601291605277bc279f4@mail.local>
References: <20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
 <20260126-optee-simplify-context-match-v1-3-d4104e526cb6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-optee-simplify-context-match-v1-3-d4104e526cb6@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5913-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,mail.local:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2A00B1E2F
X-Rspamd-Action: no action

On 26/01/2026 11:11:26+0100, Rouven Czerwinski via B4 Relay wrote:
> From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> 
> Simplify the TEE implementor ID match by returning the boolean
> expression directly instead of going through an if/else.
> 
> Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> ---
>  drivers/rtc/rtc-optee.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
> index 184c6d142801..2f18be3de684 100644
> --- a/drivers/rtc/rtc-optee.c
> +++ b/drivers/rtc/rtc-optee.c
> @@ -541,10 +541,7 @@ static int optee_rtc_read_info(struct device *dev, struct rtc_device *rtc,
>  
>  static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
> -	if (ver->impl_id == TEE_IMPL_ID_OPTEE)
> -		return 1;
> -	else
> -		return 0;
> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);

I guess the correct way to do this would be:

return !!(ver->impl_id == TEE_IMPL_ID_OPTEE);

But is this change actually generating better code?

Before:

static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
{
        if (ver->impl_id == TEE_IMPL_ID_OPTEE)
       0:       e5900000        ldr     r0, [r0]
                return 1;
        else
                return 0;
}
       4:       e2400001        sub     r0, r0, #1
       8:       e16f0f10        clz     r0, r0
       c:       e1a002a0        lsr     r0, r0, #5
      10:       e12fff1e        bx      lr

After:

static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
{
        return !!(ver->impl_id == TEE_IMPL_ID_OPTEE);
       0:       e5900000        ldr     r0, [r0]
}
       4:       e2400001        sub     r0, r0, #1
       8:       e16f0f10        clz     r0, r0
       c:       e1a002a0        lsr     r0, r0, #5
      10:       e12fff1e        bx      lr

I'm in favor of keeping the current version.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

