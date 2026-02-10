Return-Path: <linux-rtc+bounces-5956-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOH8AZHAimkeNgAAu9opvQ
	(envelope-from <linux-rtc+bounces-5956-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 06:22:25 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 715801170D4
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 06:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB1863032DFE
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 05:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6A032AACF;
	Tue, 10 Feb 2026 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEdxU484"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B435298CC9;
	Tue, 10 Feb 2026 05:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700928; cv=none; b=AnkzVbIAe/lnF0TRM5nJHsuoCHvWIPzLbzvl9FYqEJF7a/0gWTX1Cj7U1yMlIYUaMoR7XdeXSW1iYmGvAnkN+eDzwflrocuK0WO1Tm2//+fGuHezuKxk0cQQo1YZetncH2AwqwjJifmNv3SDpRNRBtMPr20L9KA4DcP9kuF0Sf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700928; c=relaxed/simple;
	bh=glo5WwPN7zuxUs13l+Gkpb+FSft51JklOnxQCxcPTAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHKM6Y50JcJFJeGrK8oRMB++n9tcBiZvoVgy4HpPmImTwE24zrYX30aOI1EZMoHpisVFN7+biAAq5xq/XQirdZwRaGx65EkJKML+cYBJzQ3457CroxZR/rl7cnpXP3zDr+NhpZajDg0Itt0Ab97Gy/tltxAO11Y6YwKCvhoSmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEdxU484; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397D8C19421;
	Tue, 10 Feb 2026 05:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700927;
	bh=glo5WwPN7zuxUs13l+Gkpb+FSft51JklOnxQCxcPTAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEdxU484MqZsTrEdVZpGu/8ENWII1kfqKlYUu2ZpvWjh0ENVIod2TylMPL/lXF/HT
	 p9f00xw7EsJYEzngZEiS9V3uGgQMtx4Sh9w1HTfP1hgUn2jOti75rKQrX56MNsWc13
	 QvmQ6XLFN0L7UQACvaJWNnnRTff7C2wj4/KD9W7Mt9ikfERrd3DLDtEbvDF6LTODAx
	 GhtDWnt7D0+XLWRu8IK8mhdwxY25VM63RAc9UjDi9YJzR1PzAAlnvnNXUq6JaoifUy
	 bah01WWs0jULbJUrtePZd4Nsd1i05OGKr1GYk7EHnBAM4XuTxCP6eezRPyijKugl9a
	 SP5K3pxToywoQ==
Date: Tue, 10 Feb 2026 10:52:00 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: rouven.czerwinski@linaro.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/3] optee: simplify OP-TEE context match
Message-ID: <aYrAeEiqG7iwXm_w@sumit-xelite>
References: <20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
 <20260126-optee-simplify-context-match-v1-1-d4104e526cb6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-optee-simplify-context-match-v1-1-d4104e526cb6@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5956-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 715801170D4
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:11:24AM +0100, Rouven Czerwinski via B4 Relay wrote:
> From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> 
> Simplify the TEE implementor ID match by returning the boolean
> expression directly instead of going through an if/else.
> 
> Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> ---
>  drivers/tee/optee/device.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/drivers/tee/optee/device.c b/drivers/tee/optee/device.c
> index 950b4661d5df..4c85b04d6004 100644
> --- a/drivers/tee/optee/device.c
> +++ b/drivers/tee/optee/device.c
> @@ -13,10 +13,7 @@
>  
>  static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
> -	if (ver->impl_id == TEE_IMPL_ID_OPTEE)
> -		return 1;
> -	else
> -		return 0;
> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
>  }
>  
>  static int get_devices(struct tee_context *ctx, u32 session,
> 
> -- 
> 2.52.0
> 
> 
> 

