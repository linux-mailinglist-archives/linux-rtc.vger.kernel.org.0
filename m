Return-Path: <linux-rtc+bounces-5716-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C59D0A254
	for <lists+linux-rtc@lfdr.de>; Fri, 09 Jan 2026 14:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82CFD31C014B
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jan 2026 12:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6020E35BDDE;
	Fri,  9 Jan 2026 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="qLSJfgM3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6C35BDDD
	for <linux-rtc@vger.kernel.org>; Fri,  9 Jan 2026 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963022; cv=none; b=Rs7oRuyrqBTNDNix1zHXctFQ7HTBzKr/CEHLixovaivc+E6RgMq+6S7xTvHqB4O6W/DiE2Z5kJUBwq/0mW56kEUscVLJXOQuy/VJETaaF5DwHXJ3PApWwYIghIopS5YInT6HZjGH0eoBhZt/JTBu11sh5FQW7UNw40UzmIb0y48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963022; c=relaxed/simple;
	bh=09aBCOlmjiSpSAUEJSYh4zX8TNKn3DhWbXsBcGvmMcc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UmI8kPYNyHapf7YFQYmFv7BXsvyBt9LXbtiyLCobZo4MTfyFUFsIgh8CpykwRL146l8GZzWihx8umFj4mIA/uJvczcPMrcC2tz76AMMppm1fwAXLbG69gnnI/fEhq69m1S1ht8c8+eJQYC1H+af9NhlqAnJgzQBRYWOuH7PWdVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=qLSJfgM3; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1767963005; x=1768222205;
	bh=09aBCOlmjiSpSAUEJSYh4zX8TNKn3DhWbXsBcGvmMcc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qLSJfgM3Ed+24SxlgNIW6nx/+2PXLyxgLinGaY+u/PD5cbt5deWacWf5yIxhO2KQP
	 RbOPU0WFsXXUbh/8KJkLh1qrWLfDNJjs1XaMwIeQI6UdT/oWFpzByukXFZ6BSB6xwJ
	 60pyxq2E4n5JbbfPHj3QD/HHRqbZ/MyAMJZlvAaxLT+GjXitYqEXN8E4R/UBnIeMpb
	 a/XTO8HTgE8N3gYBmnPgLwHch621FQ/JJg4EOOzJkxoyb+h4oRtXgfkhhrdH+X9iRb
	 UcUm/iyoZa1ipfS/updpgmQZ3E3pVJs60i+YuiTWPx9uprjqySqEIe8DyMk7e2Hwzu
	 ZbMnd4u3MqstQ==
Date: Fri, 09 Jan 2026 12:50:02 +0000
To: "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>
From: Esben Haabendal <esben@geanix.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard preceding error
Message-ID: <1lX8JrkfAkOKCEc0GkvmCDlh4iSKAsk-KwnT9WaL71NCwPyw4vUCayXNFgACqOyzZLLCzs3X2_q3H6m5m1e-Y4QTnoym3Jdk233ctrcqBL0=@geanix.com>
In-Reply-To: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
Feedback-ID: 133791852:user:proton
X-Pm-Message-ID: c4b7e10096dec97f16a5ecf3a521c021291150f0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, November 25th, 2025 at 18:35, Anthony Pighin (Nokia) <anthony.p=
ighin@nokia.com> wrote:

> Commit 795cda8338ea ("rtc: interface: Fix long-standing race when setting
> alarm") should not discard any errors from the preceding validations.
>=20
> Prior to that commit, if the alarm feature was disabled, or the
> set_alarm failed, a meaningful error code would be returned to the
> caller for further action.
>=20
> After, more often than not, the __rtc_read_time will cause a success
> return code instead, misleading the caller.
>=20
> An example of this is when timer_enqueue is called for a rtc-abx080x
> device. Since that driver does not clear the alarm feature bit, but
> instead relies on the set_alarm operation to return invalid, the discard
> of the return code causes very different behaviour; i.e.
> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>=20
> Fixes: 795cda8338ea ("rtc: interface: Fix long-standing race when setting=
 alarm")
> Signed-off-by: Anthony Pighin anthony.pighin@nokia.com
>=20
> ---
> drivers/rtc/interface.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index b8b298efd9a9..1906f4884a83 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -457,7 +457,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, st=
ruct rtc_wkalrm *alarm)
> * are in, we can return -ETIME to signal that the timer has already
> * expired, which is true in both cases.
> */
> - if ((scheduled - now) <=3D 1) {
> + if (!err && (scheduled - now) <=3D 1) {
> err =3D __rtc_read_time(rtc, &tm);
> if (err)
> return err;
> --
> 2.43.0

Sorry about the slow response. And thanks for the fix :)
Reviewed-by: Esben Haabendal <esben@geanix.com>

