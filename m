Return-Path: <linux-rtc+bounces-6721-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yYG6Kd2MNWrrzQYAu9opvQ
	(envelope-from <linux-rtc+bounces-6721-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2026 20:39:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690F6A7681
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2026 20:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=my10SunV;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6721-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6721-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1F8F300567D
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2026 18:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744F233B6FC;
	Fri, 19 Jun 2026 18:39:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21117745
	for <linux-rtc@vger.kernel.org>; Fri, 19 Jun 2026 18:39:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781894362; cv=pass; b=E3NFjyqMtRYlnVx9pwgSB48eJTgx5tCXm/pwWJs74aV8lUKbgadR8/7qbvfEf+1yOFSujuSVgkKn+WRl5RT+Q+Y8yOQHbui5KZQwRz6p0lhFbFxJpXc2WkGbhAV03UTr4hqP/7MoSJghdTLgPOW6wBb3sLExhLgyAOwbkbu//1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781894362; c=relaxed/simple;
	bh=D9QPIUE5id63rtzw7rhbsP9Goc3SUeSBB3C9uW/TyUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezvLur36lfTgd+8AgFwaHB3UdPpqVq1p8obfGyRwvteuLcSCkAC39VBupOPVDrrCmzHXxdZzsQhw+6OVU8DVMUPwq+MhM9rkJJcTg3rj3DA0FO9ObD0JX6/rKbBbULz57bDSZwGeF/NT3LrRt7lFcAvWRLYnj9K3dH8FTN8A/+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=my10SunV; arc=pass smtp.client-ip=209.85.208.171
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39957d210f4so20406551fa.0
        for <linux-rtc@vger.kernel.org>; Fri, 19 Jun 2026 11:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781894357; cv=none;
        d=google.com; s=arc-20240605;
        b=jIEdyG5pn2vBmGgvRsPhUWQQrKz6H5+u2nP7p+k8oINJgnJKelN/kArlWgFhpKcE2I
         H9JdDuegbDVRGF+Xc/yKjdge1YqYRbQJYrGgbyb3SaUZ8Sg5n5wvGK6IOxETlFypErlA
         TP2yJWB8kMmB1gGe5sAAAcGe/VKfhWl6pGBwzSh+1wo+bzi/WYMDN124L7U+POOeMEhM
         oTxs+hBP7QmcSR1txi07uo2In6jGVsNQIVZvSDj0jNIVG1vMDNGBAOvkGaWg2efySJ8X
         tlKdmHF2rGR6tRIGpo4OphEkDarWPU9Lnigc7VqisTvAWPAf6EGJkQKPDGexGHgOn1J0
         vo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WsAeFekK4ZTz4EPGorcIiAcS/bJfiRWcHfoUEDEZlBs=;
        fh=v+fQpqqloRxheg66y6v5BEIIh4tqlWdyRuynNr5XQWo=;
        b=RX/vTBSvxJIoZH3eIMk5SJwY6jQWeyVWrn6IkH+uKo0m5W3vbzOKYRuYHAuMJ9/rTj
         ZVgqS5rjsYAhnkE7XMOOFO+Zqze94sVGMANrrSKyGfPv2QvvXeDih30nwbzgqvAUDs1v
         dWAZahkltiFkks+NoPwMA7jT5UcwsWVut+W44pBz7VJ7hw43Z9fufLIejyW9kGlMW9Z7
         VHJzErnuwDBInMNwhIUTtLhzaoTcqdPYBB60OtJm5TRsp6ToAyxnWa4kBgDi75AUpvGE
         Bu7bCpkv4o6MiHNXrLO4rgi9lP+MaU1W8l0QcW/HmUQeLIfG5oGllFiBFfv0sXjUKVDT
         yyaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781894357; x=1782499157; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WsAeFekK4ZTz4EPGorcIiAcS/bJfiRWcHfoUEDEZlBs=;
        b=my10SunVWElmqXpkpiADPLsp0RA/rP1afgQRk23vkBlUDNUWuEBnkCcJ5KXWmg01mL
         VwhKsrd8WKboWRbNqjSHBrKZb5sW5W6gjH5W59aiRlRJawmjuDUZUnDxOLLOM7V9KNt6
         NDjpGM7TCZq5WUyTGR0a48LxdnWqe89niTa0c3tuNI9+ylUheMzJ84uB3nsPh4HBQP7H
         hA7XjzdSWnUMobh1qDpkMWTQcNQvm4Fe7PpfAOJReyDcviEEyu6DIWtsl1NM2uCAekRg
         gCB7RBVorZtrweY5j/cyMG+iQ1VT2K3MwE5J0OgMqudbS8wbzZLokx7GlzTYlPNc+L0o
         2fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781894357; x=1782499157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsAeFekK4ZTz4EPGorcIiAcS/bJfiRWcHfoUEDEZlBs=;
        b=rAmWl+rsGz2IXbBSPrT5Pj6Zo3YpXqXlVqwSSBisdBPkJvFEc//CP6HXT8oYCec28q
         mi3Ewe1hJYNhkwrnbugO4TbEC7Mp2IWsSF+xOIZZwMpTWAHGdcDOtWqq9by1TB4gTCku
         waVxqbsYChaXkcrBH/noswaD7OVmssGUSBMm2Q7GpLpd9eMXgvWXM9CK+evrTDakYc0+
         5bBffAqTka/hYXT/Fg0gVJZcCczrxNQHPv7rQ6eosNQHfcEp/9PSiEf1HiqRk/beP7tA
         ehQpAJFkDn11vHp4K7uriOXguOdhRCG2O7NCalhdqHfmeLNYfhMB1Ul4BOAbmTNR16mg
         +rOw==
X-Gm-Message-State: AOJu0YxvhSC7lhubG0g4Cg0XASUDLnUAWJSHT3OXTo8QJzlwrfkWsiSz
	7RpoCw//uEBt52K+hnpYMFbj2VpvJQePk+9hpVCaDTopUmmZgDOnhv9WEOBJzo0ET04YzNiQN0P
	oKJ/KZUM/ACRzwNyHCC5s6kB1rWwECgI=
X-Gm-Gg: AfdE7cm4vD3Zb9DCWW7WBb6jQtsn7v9eIgmW/coptcpqo0597zBjePJTgOdM+z/cHG6
	xdKSIeSkChjzr1+uTt9+YgVOf7Go/hdObiNpBM6Exbr9BrHN2uKpcesT7IwYkcKjbrvgLQc/Js7
	3w8ABCN/4GN/YKAJxKzXKcm50pZL1x+pzgC89OfHIjkoJH7GDvNQwV3vdHr9ExMpEckOyWvfMY4
	YaRNs+t58l7qR5SroY3FYqL+CbpITI3dpfFfeYH/CSwPRNuV+KZS2FtAuWri/G1pSDjWIkFOA==
X-Received: by 2002:a2e:a547:0:b0:393:a145:54f3 with SMTP id
 38308e7fff4ca-3998e4cce2dmr10116251fa.15.1781894356749; Fri, 19 Jun 2026
 11:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601194615.1979101-1-dbgh9129@gmail.com>
In-Reply-To: <20260601194615.1979101-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 19 Jun 2026 14:39:05 -0400
X-Gm-Features: AVVi8CcwfgArLgaWdPBUNyvUZvOL-TLG6e5El5Cr2hP9rRqv6zblTFG5h1BtoVo
Message-ID: <CACrCO_XDnxgHvYJSpQkU6WxcHz24euSdpDsbZkLG34oDpPhr_Q@mail.gmail.com>
Subject: Re: [PATCH v1] rtc: m41t80: clean up watchdog on probe failure
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6721-lists,linux-rtc=lfdr.de];
	FORGED_SENDER(0.00)[dbgh9129@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1690F6A7681

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks

On Mon, 1 Jun 2026 at 15:46, Yuho Choi <dbgh9129@gmail.com> wrote:
>
> m41t80_probe() registers the watchdog misc device and reboot notifier
> before registering the RTC device. If RTC device registration fails,
> probe returns without calling m41t80_remove(), leaving the watchdog misc
> device and reboot notifier registered.
>
> Both watchdog paths use the global save_client pointer, which can
> outlive the failed probe and point at driver state that has been
> released by devres.
>
> Unregister the watchdog misc device and reboot notifier before returning
> from the RTC registration failure path.
>
> Fixes: 10d0c768cc6d ("rtc: m41t80: fix race conditions")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/rtc/rtc-m41t80.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index b26afef37d9c..f4a30320c6ed 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -1009,9 +1009,17 @@ static int m41t80_probe(struct i2c_client *client)
>
>         rc = devm_rtc_register_device(m41t80_data->rtc);
>         if (rc)
> -               return rc;
> +               goto err_wdt;
>
>         return 0;
> +err_wdt:
> +#ifdef CONFIG_RTC_DRV_M41T80_WDT
> +       if (m41t80_data->features & M41T80_FEATURE_HT) {
> +               misc_deregister(&wdt_dev);
> +               unregister_reboot_notifier(&wdt_notifier);
> +       }
> +#endif
> +       return rc;
>  }
>
>  static void m41t80_remove(struct i2c_client *client)
> --
> 2.43.0
>

