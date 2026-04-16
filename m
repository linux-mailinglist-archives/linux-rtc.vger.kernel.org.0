Return-Path: <linux-rtc+bounces-6354-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCHVD0y74GmIlAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6354-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 12:34:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116340CF63
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 12:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6E8130107FC
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 10:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734A23A256B;
	Thu, 16 Apr 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="B9BM1rtF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F439F193
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335605; cv=pass; b=Kx1aRvF7zwiu2yxcfc/OdDtxlU4Aqg5BaGdC/1dTercE2LlHdAabHy+vLlz9UzbQPeYJfXmC8JDDk3pq7H4S4x/t22bAOwF5tINOLLj1opx8sWAtgPXhyaPc7spi/ERld8ROMCMD5hyyzydVhcSjJQf4KRu5iBc81OS3wimm/Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335605; c=relaxed/simple;
	bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH81enFN4A/OfJf8BbOAvqkBTqUQV7HD58mN6A0HAoRBYa8LkkEw/ohjZ10KySFV+NOp2t6Ed3kaNRsvuV6DpJV+Sgcxu7xkyVPL7KaScYxufxcK9fgStXQ02EXf7NmqmzKNZfE3vl6lmHBuKyXXEhq85XfAgEBsnolTX8yS/s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=B9BM1rtF; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-41c10ff02b8so253252fac.1
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 03:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776335603; cv=none;
        d=google.com; s=arc-20240605;
        b=lQbp10sWQaTz3oy945LIk3J+ZNoqffLaRqchaLdNer7FVVOG9gfdjWFPhiTB15x1x7
         AWFAtNGxxe2dahIrEa2gQL229yG9noAw031K83S8S2qQc45U89mn/EGjZ2K7xT0iX0xR
         KZGSGvlAZGlVk+BSOiE5L2Lhz/HrGt21EyY9/pMScgwsG0oGJyFb5/05siGp61XtqOjR
         pBafPUcpOrCXA65fhGiLnzvcDaIuWcHeCBhqbpc/Zl4K8P8p72AH4H5O9M7C949wwAnZ
         kYa2wzmMqZKyb0T1GOU7MQBy0oK+ecvh9h8xQg9RFWMFI+jxpiH0qzSO06Q9PZZptb3G
         sN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
        fh=enOFluY5P/1CwQFVsbFPIUEUahI+8YyuIVEv4xqjLkc=;
        b=YkcoXHZxz8By9x01LExA5bL03vmeFShKi0csjucmQfm7wqoVGZv71h6hdWU9RyFuua
         kPky/KkXeXJp9cepgE1fIYT3Yf8ZbQRUT6ROJ2dL3fXyx3OXU21EOPphMllG7VJdONbM
         tXqPKq+x7h+8HMp9/XABSx9kfQd00IiHS5avWueN3fXasowi5O9Mbb+YSGyAm37kMk3P
         vL51xE6fH1hyh3scwv9xvd77kjwpSzaSar/SxUiCb9CokqBRswHsmsLfEwScEKnRkUWA
         5E/Lm3BM+mAyHOapWjGTSix/8r81b988s9eZInXiXhUjzqhwAOjFvqh2HpYQahVa9pvD
         1QCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776335603; x=1776940403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
        b=B9BM1rtF2c2V2dZx0YIK7ZBfI86RCFTH3w9ZB56U6T16m2baMyVOShnQaFAAKJnlrV
         dbhSYONpoL6zdFXTL/sXkRXaBdUdOK/xw0d3y9CFP6m5M1RgQI3eDiBTcsDLYZApGgEk
         yUicuaavLrrsQIdPMWQ0SSRy9kvo9+h9zMg8Bbuwqr39kPUWHqDYgpZxuwuFwjaL5kRL
         L775Buz3czvUJ0qv4JCr9Xp4xZyG2EU3WrdTIuXX0xHsutmKcvQtnCc/jflTptbCMNvE
         ngGBOR8N54ymJTM4XnrqlsMLDTj9/OfK9qYvmqTSXM3eRMYRvhfMFb0D0l1HXbzHaZhq
         SXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335603; x=1776940403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
        b=QddYoksvWUT4XZx6j8nh/rJUqmi41HYYuNpAQ+TjyHEmhEPzR61GKlNXglsMfcSICh
         xOxyaEzCRe+eNnOyvM/FXo4S8eL8AzXXNjkQMIQPTW5mnRUzACJab7xRFL7MTMqh4AZb
         6LovB/4z+Lx3Kvubm1P0n5LkJKRu3oo+Dm/FMJA30PmAABO/QJJelVAf+ByA5zH83cTJ
         LRsRShjeHz+VmDM9acWHGFvVrQF/g7xM7jcZrP5ZuJPSt/PP8uzNn7sKItx94zzm6QPp
         rVvHolw96X6hNTYrr3z0aVXm4yPabseP+wFkNXp5u0BaWC+BZCt/WOwdQX+16vLa4Ws2
         k7Xg==
X-Gm-Message-State: AOJu0YznG+TYtw6WdCUSr9NRa7IT+b8QffqjbRZrY561BGPAjj50Ho/1
	Qn2/iWuW8QOQkq7gdMH4fHDyEwzl1T5Gj2dd4mh5uN8nGbQKUwStdWbbG1g/bsoOsK9ph99CI2N
	t64A5Q7/ayFv7fs/UnLtv+YGuXO6Te576NN8Ui/a2
X-Gm-Gg: AeBDievkrwc9dziEVTjbf16DfJu4blmYTeDKwVRZpCJlsR+E7n+m5LDnxGDOlS2+Lau
	RNXQmH6mqei7TGVvGlc99MPLuELpzH2hxWI0HXVmcZLt/XKo54O68EjaO2bHZr43+CsYEfctIx9
	RN4cRyjoyBApyvEr8+nF547iYk6zzkUKDCKXD+km7NoTM7nMNmpdyh3gU3t8w1B2Fr/4gzrCJei
	C77TOiXaa1ayV31hwVnlmS6YKrT29IgzEY+qOMkhG/FUFgUa0Ms7XJXmnSsIhhMoEPDxBnWOC7m
	MemsbhfhzewZV0gECAYuqHFMBM0NoaOeJDFOHJb7O69AQayCMNvS
X-Received: by 2002:a05:6870:c69e:b0:423:92b9:5ce1 with SMTP id
 586e51a60fabf-42612e3aca4mr2210815fac.7.1776335602563; Thu, 16 Apr 2026
 03:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416092414.3210383-1-adriana@arista.com> <20260416095706.3212158-1-adriana@arista.com>
 <20260416095706.3212158-2-adriana@arista.com> <20260416100354ac85cb48@mail.local>
In-Reply-To: <20260416100354ac85cb48@mail.local>
From: Adriana Nicolae <adriana@arista.com>
Date: Thu, 16 Apr 2026 13:33:11 +0300
X-Gm-Features: AQROBzAX-RAhjw4JwkHHyO2XcSkeiIxM2zy7fbiV7Qac4LnF7Shh7IHBsR9v2qo
Message-ID: <CAERbo5x1zV2m=rT4ETQzajMw=-XT-p5xF2xaZC26Xr6kSD+S5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6354-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arista.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9116340CF63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 1:03=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 16/04/2026 02:57:05-0700, Adriana Stancu wrote:
> > Add a configurable "ti,read-settle-us" property to resolve a limitation
> > where aggressive I2C polling prevents the BQ32000's internal register t=
o
> > update. This ensures the hardware has sufficient idle time to update it=
s
> > buffer, preventing stale data reads on systems where the "interrupts" a=
re
> > not configured.
> >
>
> Why does it need to be configured?
>
In my testing on a 100kHz bus, 2ms was the stable value that resolved
the issue with the hwclock version I tested.
But it might be a delay too long for other systems becuase the
required "settle" time may vary depending on the I2C bus speed and how
fast the userspace is polling.
I chose to make it configurable to avoid forcing an empirical value on
all systems, especially those where a shorter delay might work, or
where the interrupt line is properly connected and no polling is
needed.

If you prefer, I can change this to a fixed specific delay in the
driver instead of a device tree property, but I thought a configurable
value was more flexible for different board designs.

