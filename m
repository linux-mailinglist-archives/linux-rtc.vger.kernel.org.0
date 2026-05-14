Return-Path: <linux-rtc+bounces-6498-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAzVDN9OBWrcUgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6498-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 06:26:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952E53DA44
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 06:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B5103027354
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 04:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8D91DB54C;
	Thu, 14 May 2026 04:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QU52XJy9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB88374E41
	for <linux-rtc@vger.kernel.org>; Thu, 14 May 2026 04:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778732758; cv=none; b=H35qThRQjvlQgwaAy8FrrYpTnJt452QU7jFb89uz0MMiMbr1O/WPrYvJkSxvIt3gGq0Nj0chbViHrLndLcOHK3GIbgKJEycTTru+amAj4yE5VKp6t9lOxvtM1xXMnpfjn3ioNrpIGrwmVJAi7fghReVmZBSFgMycjbX0XM3B2U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778732758; c=relaxed/simple;
	bh=Xk9UOkNIs/6BZtbVkVNxSjWkErNcowjkARNVXgeAc1o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=DRsyZi9Ps8U9e03NtyMlKVD+RXe+ufePjVAhK7CL+qR/GJRb1t0VJVzAe2Qk47k/uWK6/fRPCRrgUepeYyisO4uqY64Lhc/8zFOHwzmZKPUIhRI4fes8xbKF90DWswoe5jE/TsJVO5rUNB0tKe9RcbJEnDWwJ7Lr0UTOl1+odj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QU52XJy9; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1330d6bb78dso4295412c88.1
        for <linux-rtc@vger.kernel.org>; Wed, 13 May 2026 21:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778732756; x=1779337556; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13EaFGhc9sBhjVtX9ZyJlLsTcSvLGmruzmbLxhBQiPU=;
        b=QU52XJy9ZlRpHenIyK6djz3UFt5uUyNjvjP+VJMhdCP/KfXAvme8ULuhtDNGJ+mh66
         altNc+sGEBOs2j6zO/w+EwJ8lgSMzGs+F0xOZXECk3Hzj/zoMTDPWybUWv3f09+Xz1w1
         in2nzydjb5Bbx4ctbEKqsRP4z0KRqtdCaYaiN229N3YAkzFhXItF+xV5FhsQu5QtKd2n
         91WnMFmMgGej8cJFsCufEWqZK4Ke3OG48pW9d0wqW9mu4yY10WChZEJFLJO17omUOLyX
         kgihJ7K77lKVTJ3b5dC7dDc9cD+LSUYZ+0rhS1svBjNhz3F3Au7sfsWBKBAKMK7QuTN7
         LECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778732756; x=1779337556;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13EaFGhc9sBhjVtX9ZyJlLsTcSvLGmruzmbLxhBQiPU=;
        b=DmLIZwJHP+0mxuQvoolBJVUEV/HZ/qyO9nayytVgxBT6kWxAMoMnm2CBu5TNpRHQes
         EcomJiXSCCXqBwvaEmXYPU+zBUjUVQHlTipwIJJTCObigSTJujDazU1P0vA0IMlzZDhp
         N8XVdQr63CMkzHQv3yfeLaZMoCklywcHkvidhG7h803VVODDwtQAEWfEhXp5XcbVcBHI
         pOYVhAglyDsg5yx8Ee1BDFd7rFJgAW5042eTP0WMlcLiDFglSU2RQe31cjGQaDgMFHMT
         IU4S4Ub1CRAEjuF2oVTAK2w9UAR69TB9I9Cn3izY5y+JcOnF4Db3wydzBP8HBacSorPU
         qAHw==
X-Forwarded-Encrypted: i=1; AFNElJ91PyebV7zLibaJWXVrpfixyiFc/BFQHfpi6NxYBdiUq7U+7a830CHp9UosrFcL3cAiJpU7C9pwyRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmj5cAABgPIeVMi55s8lSVJpNlu/P0c4o+VneH2b+n05Poe8wv
	kKK6jYxcqmkkHb7fHi2ouJucDbOBJpICjsbK6qvgv5/P4fmUr9+W96vtu5ZfJXyekpQ=
X-Gm-Gg: Acq92OHXeLkvIe4U+sugV/KgaGqIVMcFW/iwSgUkP+kwzbDTAVuJ88oRWugQugQTXHa
	xJYoo6RBCZeKHVu47H2xXaGkt3BjDwH9yzWucW4aIlt8xYkixcBxSFNxnInrcLM9FiWHffd3vev
	hdUXqWLLcV0+WOysm2nvVedIdvHfC256VclC54K4AXp2Xl9K7i+Zsh4flbfpgltVPkHj1kuEaKI
	F+x2ZDs1FSUckgjxCLd22Km0fVXHJ2o7Ww0R6qHMfprP4T768epGR+oQcfeOASffOGTjiMjHgIp
	g46s4ZJeyov8muuzm6qrRLGGRnxGjS9h0iJv/824/9fqpGn1iwkykEgrfdpusKYKl24avmuH5us
	V/QI3daqhHy+rZyVUX8y8mA5p8/IB6SvtcYXpB41HX0qibmmB4M2vArJYhzIiN7tnXzV4Dxqz/c
	dUGWzMnLjPUbu3/62FtczhS1J+2EKdK0ooBQ==
X-Received: by 2002:a05:7022:f87:b0:12d:ce60:cb52 with SMTP id a92af1059eb24-1343677c21cmr4095334c88.18.1778732755696;
        Wed, 13 May 2026 21:25:55 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm2645323c88.3.2026.05.13.21.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 21:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 21:25:54 -0700
Message-Id: <DII44YQHQRAQ.1BOWF2JZ2RY5N@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Alexandru Tachici"
 <alexandru.tachici@analog.com>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "linux-rtc"
 <linux-rtc@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH v3 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC
 seed with rtc_class device
X-Mailer: aerc 0.21.0
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
 <045f1907-0180-46df-a123-cd0ce349e86b@roeck-us.net>
In-Reply-To: <045f1907-0180-46df-a123-cd0ce349e86b@roeck-us.net>
X-Rspamd-Queue-Id: 9952E53DA44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bootlin.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6498-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-rtc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nexthop.ai:mid,nexthop.ai:dkim]
X-Rspamd-Action: no action

On Wed May 13, 2026 at 7:14 PM PDT, Guenter Roeck wrote:
> On 5/12/26 11:56, Abdurrahman Hussain wrote:
>> The driver currently writes the device's internal RTC at probe with
>> ktime_get_seconds(), which returns CLOCK_MONOTONIC seconds since boot
>> and is not a wall-clock value. The resulting timestamps embedded in
>> blackbox records are therefore meaningless across reboots, defeating
>> the cross-reboot record-correlation use case the field exists for.
>>=20
>> Switching the seed to ktime_get_real_seconds() does not actually fix
>> this: at probe the system wall clock may not yet have been set (no
>> external RTC, no userspace NTP), and seeding unconditionally also
>> clobbers whatever valid time the ADM1266 retained across a warm
>> reboot.
>>=20
>> The data sheet (Rev. D, p. 22) recommends "frequently send the time
>> stamp to the ADM1266 to synchronize the UNIX time and reduce the time
>> from drifting" when running on the internal oscillator. The clean way
>> to expose that policy is an rtc_class device backed by SET_RTC, so
>> that userspace tooling (hwclock, chrony, systemd-timesyncd) can drive
>> the re-sync against /dev/rtcN once it trusts the system clock - with
>> no driver-specific sysfs ABI.
>>=20
>> Drop the probe-time seed and adm1266_set_rtc() entirely. Add an
>> rtc_class device whose ->read_time and ->set_time callbacks read and
>> write the SET_RTC frame. The rtc_class API is second-precision, so
>> the SET_RTC fractional-seconds bytes are always written as zero.
>>=20
>
> This doesn't just set the RTC time, it also acts as a real-time-clock.
> That seems undesirable, since it isn't really a real-time clock.
> It would also be the first (pseudo) rtc residing outside the rtc
> subsystem.
>

Agreed -- calling it an RTC overstates what the chip does.  The
register is a 32-bit seconds counter seeded via SET_RTC and stamped
into each blackbox record.  No battery, no alarm, nothing the RTC API
normally implies; treating it as an rtc_class device was the wrong
fit.

> It seems to me that there must be a better solution. The rtc subsystem
> needs to be involved in this discussion.
>

Would you prefer I drop anything RTC-shaped from this driver
altogether and reach for something else (e.g. a read/write debugfs
file under pmbus/<dev>/, consistent with the other debugfs entries
this series adds), or would you rather I post a separate thread to
linux-rtc asking how a device like this should expose a host-driven
seconds counter and wait on their guidance before respinning?

The datasheet's intended use is for the host to frequently send the
current timestamp to the chip, so the value stamped into each blackbox
record reflects wall-clock time at the moment of the event.  Either
direction works for me; my mild preference is the debugfs path since
it lets me close the loop without holding up the rest of the series.

> Note - as sent separately - that making this driver dependent on
> the RTC subsystem (as would be required by this patch) is unacceptable.
>

Understood -- I'll drop the rtc_class approach in v4 either way.

Thanks for the quick feedback,
Abdurrahman

