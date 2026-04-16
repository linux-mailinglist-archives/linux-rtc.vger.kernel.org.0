Return-Path: <linux-rtc+bounces-6356-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SANGKOPF4GlelwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6356-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 13:20:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370440D42E
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 13:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78E0C30C7D6D
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7708E372ECD;
	Thu, 16 Apr 2026 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="MRv+ziI7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958FD3A6F03
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338102; cv=pass; b=JLpN4o3D7pMne+pM3TBZOc5sMYIn98gNEAKGCXoz7m2EHtB3tRu260H6vKXFLQkH0vR3/pnczIkPRifVqH1nXUpBxFzedSwbMFb0zhkr9XQDHGr8d64QIYtfenNrlvmArDedFqUWglnPKSu1/nWNrqNrZvtVGEk1fje4O/fWFsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338102; c=relaxed/simple;
	bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCG2httS1up6OUr1NPp3lTdVlb+cUTNcHDgg5bIhxBrrrN8ExkGFVn9IvFgCEYnGrOFOl+DzaT74KTw9hqskU9ilMLl11FwSap5JGu0npGG3VC5IzowhE2EB6Pe7riCBVhtiURr/jn6KpWsL8+Nz9bUb1amvXQUhu6Ocu8MK4cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=MRv+ziI7; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-41c6204e57cso1548508fac.1
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 04:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776338098; cv=none;
        d=google.com; s=arc-20240605;
        b=QF3NWLoIamMhvzbzMHgn6++AVSP5dLQRwRSfYvA4rKGEBa+d+YUDyVoZua+6udI0Gw
         nm0Xy+C9MzZEn+wiESt9gwnYthEepgJr8P6hqMU+cFWkIBFIWJb+zCffJO02S8DrjW/W
         XpulHU4IABA5b8dhg8qbSwonZh6AlsnBrfWLIL+QfTC18Ym1PnZK0YZLQyseSENL9Q0F
         X/AmGM3kPLg2JJKwGKkZzDEWmqhEbmsn8QFZNr9Lb5LTHUx0dfXNa5VblCnQ7KP66omy
         viFW/BfGOQgTLGqhL8EYI/H3+bsVyxxq8HB7VTw98pvitCG5E71LW7ExZxqkQWE9qFpL
         hROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
        fh=ZMkYzUHY1lteMHAy2H5ICE0kzP9hBWLN7dBBIJ+Vdtw=;
        b=GxNmjpd5MYI9M85t+uAwGctvS3a/cexpw0jWS6fKbktz1f3NGRogOAzter5e6EsLah
         qsbns0fWKNKeXRQou7lH/Hx93sQB9u/mRlc6G5b+S5zJv8z8eaz9vMead9jwe2bq0crm
         QJv8ntBwWgg0rZ+laPbvZ4dV/0Dp0mpqu7jYz3O0cal53qwXDpfUpU/8DB9DY956Gkxn
         eUpNLssnwRG9V2oGC+bkkpFZJBDdz9xei0fDLUlxn+JogZ48chmGG+UYV/QN2a2oWzUk
         eR7ZRWHqzoxh5wFE5CRocFulvo79bwqiEINOXan2+slQ2lNTACcgeM9pHnQOExmYENgB
         IjvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776338098; x=1776942898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
        b=MRv+ziI7lNcO/sWCqah3PVn1HYy/htruGU97Cig+NwwrgAwZj+ioGYFJzCvgLM0coV
         RsyoALN9lJ5MJoPkbjwfkd5rB2Z2aQg5Fnab2okfrBhzOyFDGeCk9VWy2i4Yq5KcujW+
         j72TEWtdPsKQRJZ40xowowfBn3rX4cRQ7X8kwpSqOGi3WcZRrEfH3Wu0nfmygHIwHPmd
         ghkP3d4129aD7ue3T8/+nzX1fk45SzY6I6e/3QTlhG9AG2F8nVt6ytJMmy3xGmmxHTqc
         w5RHljY5tnJx0mbbnRAezoLh9u89XbJd85THHatANOlVI9k+J9hftZU6Nk6IqtBmGStZ
         sxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338098; x=1776942898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
        b=K2qDAKND4XL7OfLRz1jY+l49FS3+EFaBBrItNn9BvmDmhSpEHBSF65b4wj5BcJX3ol
         NWKJ1oBuqrSdHZmQre4hnqRDVcWbQYDvOkrxyGtuOYthIipXuX0Cqi3go7ANQT4NxY3H
         yg1lvLAOJZm608gsEOE2x6X3a84E8DMUCj9/z2UumAFejlNou8DAWb3reoE+lfUjHIax
         DK9Oma7xRS3D22nGrJUbd3J8Netk4md/KVQaWsRm8R7SH7rd/Rymg+06N5dCo3GnuBME
         2YymNcHzqFIZEKBFJ+IKN9UqhImblmH9diKkljMBv186foMQpOoBENIQVNJ9Akotjw/c
         XvhA==
X-Forwarded-Encrypted: i=1; AFNElJ/etO1g6ETAVkxOydYp+tKU6q8B/CEvCZHRoDdjNOl85J1rrHvMe2hoXUcJv6DNp8kefvF+YHdxZpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7V4hUXWD0FoebjH6wsoIyiI3aiMaUNnO5QGgZRQmvKPDMfshu
	kJQ4IZkc22wix7xcSZy1bUGkNJT2FxrHrmcsatrRnwQYwMoJnrt9MB0ru2k00pjxwfMtUGIcg00
	wAUjopDupeZR+/Lg9fSSCcCAB+SD4YGZ2IGW4YT8j
X-Gm-Gg: AeBDieskFFmDeND5NOZlr7Q5bNWUbxinoHnQd5BUl2Xfq3bbaA1jDT/2XlVYn2KaRgR
	l+JtwEoP7fhR4/QH5z+pj6ofk8ckm3/UWT3lGnaeBZAWWz1xzMf0qkxMD5eiyK1YNvDGCVoK861
	9PaVxvqun8TgJAyFSCNEtOcJ81m/HlZrPoBguFiCuEwiLmYIsQz38WLCjBBE/GvpiImGu6F6E49
	yau0p7W+bNftmLRKtfpHZ0KAZOPR8hFx4mr4Ni+CjrDclwpgN346WErVVP99vhOwv9zjDbt7lXc
	mQ42AmvpEot5Kw7uqf/UmIgYnT9O9Id0xqi445eWkQ==
X-Received: by 2002:a05:6870:eca2:b0:417:3414:3ce6 with SMTP id
 586e51a60fabf-42813a70f59mr680899fac.0.1776338098368; Thu, 16 Apr 2026
 04:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416092414.3210383-1-adriana@arista.com> <20260416095706.3212158-1-adriana@arista.com>
 <20260416095706.3212158-2-adriana@arista.com> <89bb6063-d473-498e-bca5-0185325608c3@kernel.org>
In-Reply-To: <89bb6063-d473-498e-bca5-0185325608c3@kernel.org>
From: Adriana Nicolae <adriana@arista.com>
Date: Thu, 16 Apr 2026 14:14:47 +0300
X-Gm-Features: AQROBzCFCGs6bn6qdgFdMqeO4xeOIwgmQaiXCM5o1sprYuY5YgEhIxJrKxK-Yr4
Message-ID: <CAERbo5x6nyQS9nm39q=9cY6y2bn-w4_e86U0OgXO1=+tSOKa+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6356-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arista.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url,mail.gmail.com:mid,arista.com:dkim]
X-Rspamd-Queue-Id: 2370440D42E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 2:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/04/2026 11:57, Adriana Stancu wrote:
> > Add a configurable "ti,read-settle-us" property to resolve a limitation
> > where aggressive I2C polling prevents the BQ32000's internal register t=
o
> > update. This ensures the hardware has sufficient idle time to update it=
s
> > buffer, preventing stale data reads on systems where the "interrupts" a=
re
> > not configured.
>
> And why does the value different between each board layouts? Same
> device, different board and you need different value?
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
You are right, the delay should be specific to the RTC chip, not the
board layout. I will drop the dt property and send a v3 that
implements a fixed 2ms delay in the driver.
This will be applied only when an interrupt is not present, because
this is when the userspace will use polling.

Best regards,
Adriana

