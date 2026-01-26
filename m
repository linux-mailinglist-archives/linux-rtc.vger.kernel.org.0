Return-Path: <linux-rtc+bounces-5894-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ElFBbs+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5894-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:15:23 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA886937
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 568F9300C276
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B9132ED54;
	Mon, 26 Jan 2026 10:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSQ0iVFX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DCC32E73D
	for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422484; cv=pass; b=Is97uYHsltDIcha7qD5uTEuG+wW63qK3UrjJR67u6s3Ku5q69SzZp7V0rd3gTP93R9Mm8tsbDELJE+kdnSD7EU8N8InEVWU0XkYgLWWO42Y+YWRezXsg9nf/ZKw8lOAxSApXDdUHJ4kF/yTIPjsf8znpeaFJSAP9wgAfQiE/Ocg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422484; c=relaxed/simple;
	bh=592arfCzKGEEI9SsaoPXnjPAToUssVCz65hbUHolUeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdJWo80EeSdqmxtqQMFmrQMzaQEhmeA2uUNrgcszJW6E+LdOaRZFsko0ydWJLFViOEOJXyRsl5Wnniwqb+z793eEn1fZtJlvRkbmvIRabHJ2wCn4JF+MQY2r/hN8oqIjwXNl25kxbKbfEY5VEDvVUgc/s56d7zFe45GO6IvhpW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSQ0iVFX; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso33819115e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 02:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769422481; cv=none;
        d=google.com; s=arc-20240605;
        b=MSBNq6q3Glq6kzaqZpEtEuckt2kynoEchTzEtCjLZjD0nYr372hDcInRDORxM39RPC
         YCydSfKl6F96RFM5Gm8RdEBYG3I6DZaH1GvqcZVrIE9aY3WDJ2MIJIk7e0bS1MQIOZVp
         IZ1/vKyvMs2xpXNla1w0Nq/Z3Abc78rbZv6Lj+/wPx44SBXaA8dnBvoNdml+/+W21B1X
         OkkmY0Pg10xdj+ptGZrln+krxyrM/1hifZuLnL4MkBrFPmyKmeZJFjllSgKtjHLG20U4
         23dNs95U1S8JHFvMy5UbzjHZChlBU6lK08fOEDJpaNO5VJg4/T/ngfQpJT117uZlW+48
         bPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5fg+wculjolsM/YfIrc/6Q4VkgefoBAjkv+6Ml7KMXI=;
        fh=Fa/sed7whOA3QTUB0Mb0YGF2VVNFm5ehsyEfdVSHSFk=;
        b=NzN67bQ2alawWPmQ+3XY6G41YDVUfA4FKL7HrK6PQlc2ymfFg53TqRBtbkR4h17SD0
         C/XoqR22ERPnHE136X3PtxCdnmPb3Sq0TUxdneJmv7Tf23dbceg00YOLnw+CTRoWSHJM
         9MklLvu9YYDPDH6lHidHAETrgTvGyOEswrHljCxzS4id/sYsHL4oOAGV8ubbZxXu20JX
         KbY+H7GMuf4VA9kE8n7LLDcGxxoGDVW/6xZ5nmCSvgsbloU5NkeucEOIsaYjk2m0zr2+
         FpCiwFveUMS/D6Fsalj18XBMqzDX2wjfNr9yiavIgV7N+Gfnxm8lsQuUCke/zQa4yZ7V
         9YUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422481; x=1770027281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fg+wculjolsM/YfIrc/6Q4VkgefoBAjkv+6Ml7KMXI=;
        b=ZSQ0iVFXMmjK/kc/36PWwYn4SIrOzwzn64dBLWxLogB/IELrzncsWDA2xmecOprrql
         XB02nP+PMTjnLm9+7uQWvkVWfFQuFyJHqwnyyOLewAUvPrxlZ35sX6hdzEHSJJ35tfhy
         GToGY9njBZgbwQmlJnAysa7a9cKAExGnzIgRHVFDt7HTPd8aye5R3dKMj6SoCP9h4nKR
         KjG4ouvwKNB/XLuganokKzr4Sks2DKsa1Wdtyj+5BCGndEPt521lm3uJR1lEjqVWvIQP
         AMUC3K66yaytIOkv7DztJ5qn46kpw5Y220aiMyHvs5louFTljILfK6LpFWjcyNfRmcvM
         Hxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422481; x=1770027281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5fg+wculjolsM/YfIrc/6Q4VkgefoBAjkv+6Ml7KMXI=;
        b=i0UUYTxHxbv5q/322iQcH2meq+eNEJZh97ZPl1Kykmszc0GW4v+lt3CDf5bMEC6pPr
         BYjeu+jc6gM7SON0atAC7a4qi+VfBHgkO7+wSsiHA9b2fnedDmRPpPlFbfmsBO/tQG+U
         YgYTeOCnNiFlJgPcMdSRsGaP543oJUiqZ4O3/6Q5X1EAoLRoLjJ/t12aNTHkR/h5HFKL
         EtrYVSDLt/jmtcDcSF8oIJ9w/vzmpTVOVr4tzyRHcp1zXznxhs7UymB56Sw8z3oy4/rU
         RCPek6xmaPoqwfMuedeptRbPcPRBKKITBjw+Ifm+L4iQX4jby/xUlvjiVFyKSYJ7SnGR
         rZzg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Bhcdm52PbcODp5HHB4GUw6+em1x9oOOvra4Qpf8VcafBuTPb8rTCENQf4qgwcYip4KTyTUXysKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkke+4DoNssXbOhMsTXr16Ewo5VnRX0Mj8k8M47q9h1r+0umc
	WXN8WWpddY6IuBy08jllkA20GCdFtJn2k13sfsgbkh8W9Qn23xOlpbrKs2nHGxNOhOYUG8vwM3G
	Owf8ljHAjmUrpCcRMazXJkhq/MK9eePc=
X-Gm-Gg: AZuq6aLTIVJCm5w0MNFWFfLWFx+SKnBzIoz9iOaq+gUj93WtpwR1mFSl2KBwIyXjIhC
	HOU3LAdlk9uWTnOQ+JmhcZ42aj16jcBJvdAmIpf9Am9eiituse40Exm8HWnU6flIyulgjFmFctN
	IAKR8PzSP9DYdqV8ui8HMRM2dE0FzAkxuY2Nr1kXzcwbFWA9D/IgIDEgnbOLpXugxT+XVJOA2KT
	sy43WuG47hDqAn3lMzjoC7BVYur8EZxBBxLuMbSov69UY4BKmGYVZ8VvnSTseE56EhD9V5i
X-Received: by 2002:a05:600c:5494:b0:47e:e78a:c833 with SMTP id
 5b1f17b1804b1-4805d064297mr63059575e9.32.1769422481165; Mon, 26 Jan 2026
 02:14:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-10-clamor95@gmail.com>
 <aXc-Sklb6QTWLvcE@smile.fi.intel.com>
In-Reply-To: <aXc-Sklb6QTWLvcE@smile.fi.intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Jan 2026 12:14:29 +0200
X-Gm-Features: AZwV_QihBi0RBeQR-keWUCWb4tTVxVMg1HeR7j7c13MGT36B2hq70uBMvm9ETsA
Message-ID: <CAPVz0n3QBhi4qmyT2y7J8i_3kXDW3tXtC6D4XQnhz2H2W4-XRA@mail.gmail.com>
Subject: Re: [PATCH v1 09/10] mfd: motorola-cpcap: diverge configuration per-board
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dixit Parmar <dixitparmar19@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5894-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: D4AA886937
X-Rspamd-Action: no action

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 12:13 Andy=
 Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Jan 25, 2026 at 03:43:01PM +0200, Svyatoslav Ryhel wrote:
> > MFD have rigid subdevice structure which does not allow flexible dynami=
c
> > subdevice linking. Address this by diverging CPCAP subdevice compositio=
n
> > to take into account board specific configuration.
> >
> > Create a common default subdevice composition, rename existing subdevic=
e
> > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > Mapphone board.
>
> ...
>
> > +#include <linux/of.h>
>
> Why?
>
>
> ...
>
> > +     cpcap->cdata =3D of_device_get_match_data(&spi->dev);
>
> device_get_match_data() from property.h.
>

noted

> > +     if (!cpcap->cdata)
> > +             return -ENODEV;
> > +
>
> ...
>
> > +static const struct of_device_id cpcap_of_match[] =3D {
> > +     { .compatible =3D "motorola,cpcap", .data =3D &cpcap_default_data=
 },
> > +     { .compatible =3D "st,6556002", .data =3D &cpcap_default_data },
> > +     { .compatible =3D "motorola,mapphone-cpcap", .data =3D &cpcap_map=
phone_data },
>
> > +     { /* sentinel */ },
>
> No trailing comma for sentinel.
>

noted

> > +};
> > +MODULE_DEVICE_TABLE(of, cpcap_of_match);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

