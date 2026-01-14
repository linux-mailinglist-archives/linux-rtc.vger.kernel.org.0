Return-Path: <linux-rtc+bounces-5749-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C0D1CE1B
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 08:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CA60309DEA8
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 07:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D3537A489;
	Wed, 14 Jan 2026 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="l7obLnpY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A836C5B5;
	Wed, 14 Jan 2026 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376443; cv=none; b=OTh4Uqt81OE4rTpcsagQcFVd7y4ZB96KPGCantg/3n6kjnTO8YFd39zAlRYkm7fmI79OeJd/kxXkRjp+YtAUZaURxM7Gr5ulR72GOzGKeGNS55TrzIsEuy2LKN3D7db3kNgr6KDNfFmcJMie2WctjzIUCOZY5LOde2xT5tJ/X/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376443; c=relaxed/simple;
	bh=6kFdfpIlv+NjbpVMkAAzrX4Pd5Bm8hvjOOYjFPgOi9g=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=c/peqDMA//cStRbCRCO7S04YvtH0W9MzXJgtX7hasnJCy/OMC/SffOlj4sWAm5T27Zea8Pj3uTNAWBfR5DsAa0/odcEdZfbF4zrDvZJiqzHEPUJaqWYEngtPzN/YcdaLiPRhocdwbolEO+fggIBM4ger1CMPI5utyjXDJrqBL0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=l7obLnpY; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768376433;
	bh=Y3hzIqe64eTNPZAr7HNM5Jzs/tphW9qIwXZhK18bDVM=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=l7obLnpY60m8oq9Lcs0ioZmDcN0sEkL8KPTJPhOQJA98ugCx8KhVv1NjYHXJwlOiT
	 JlcvH+mCcomFVwZ1rpgbaLmZgijtdN7WYhhlH9Wo+hnAhpIuEM3GkkVUpln2+XidzV
	 D4eKJ5HXrfFQqBHsUV4xMKOAN/TP/+rfI/P7niEs=
X-QQ-mid: esmtpsz16t1768376428t13e77d3b
X-QQ-Originating-IP: 7aawJ3yx9b6VmjulJJNVsFBb2N3t4qxK6xGf9s1FjQk=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Jan 2026 15:40:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16254600035269256280
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 15:40:26 +0800
Message-Id: <DFO54J7CRS8U.1D9XZAJHF57HM@linux.spacemit.com>
To: "Lee Jones" <lee@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@gentoo.org>, "Alex Elder" <elder@riscstar.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-i2c@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] mfd: simple-mfd-i2c: add default value
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
 <20260113124241.GB2842980@google.com>
In-Reply-To: <20260113124241.GB2842980@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MXZrlka9y5vP0G/aUW+LGbj84gBjK/DlLrrIXDZcz6r2MUyNWSddBQR8
	PKLmINbRsRRQKOYXmfhKmSU+GLslQdYlX3gMxuLUStFDVe3xnlCkx6rtS+b+hTxV6M0SYQT
	cYF1vv0DL7ib5ol7/uRPL/dTaKJ+sR/MU/TwiU0CHWqjlULVY2s8xGBoKpE+VB4UmoY87B2
	lOzkmaiJUqExZGokw7Ejw31oZq0z0tV5LA3mk7MMWecwwRCU7eAENX0aJP/UbHJZ+y9lt/9
	dpqi/Mac/BWb6ItlXzvhWDtFRxXzPwlepH/1hY5h/TKp/O6BOCn3amKi3bsopbxbXalE6/u
	VTqyCV6ZVNFNibkbmD2tLr5UPm2rxzlUucW/p9bnk/+hGt+pKJoxKetJJ4ATOsaPmOCpDeC
	lTZ8+1WxbCoB3BJJ7xwnIxBbfESicRdJzTCPtLEyDy1kbH/Op5ggco9gEEjUfbhJFGuK9L/
	fQTFAinsbdlhrLpldxqjMeS2KCIZeW2fVil5Q9ICv3JbfqPTEtBjmTSa66K/UkajKdoHAXZ
	4WASUdLPYq/XmjR/ylRQ2B3oi3TVB4RkoKW2CXg4+JyHjY8eoAD8QrrPcUfsxm/epjmFkEa
	W9zvGGKR1dLoixSak9J3PpkBzgKvf7NX1n1ntIsiNNvdMadhdvw8q2b5l4fG8GhfF1vlShg
	4R2nErrrXr2e6BNOUxywxvRpckUMqd9S0MX7oe4mSmBDHy+baoymT5OpSUm27W20g1o5luK
	4n3SFWjxiFS6CiumZTyZ/fIcnz07VEikjfFuLjWCBnJNoYda7WmTnDkzZWhHv20Renv6IpC
	9/IO6WSeifuGQOMPbjD21a9At9NVoMXtGn3cvUHXtBCoRb1bh5I4F5KV/WWKY/1HxGJ6OoH
	iZBI8jXVT9OkjXRF7gMQ9CSS1XY2Q1OqU4gm5QYCLVg3QLXAHZDIB1L0VBtQTMKyBATeJiq
	w/F+dz5Vq4OkLh8pVcj9PeCs4mIR5l/oKMjeooPHNg1UMi/i9JNSnkBgtgxRmyXDvIeTOjy
	XHPoiQoGDYJusbUkpNj4ET3jFHpKg2ngcv7Vq8VtE6gZEj7NPpI5CUOTBth6vxTTaod42iC
	ppVeFrvPTUq
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Tue Jan 13, 2026 at 8:42 PM CST, Lee Jones wrote:
> On Thu, 08 Jan 2026, Troy Mitchell wrote:
>
>> The default value of the P1 sub-device depends on the value
>> of P1, so P1 should have a default value here.
>>=20
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Change log in v5:
>> - nothing
>> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-2-4=
4b6728117c1@linux.spacemit.com/
>>=20
>> Change log in v4:
>> - default m if ARCH_SPACEMIT instead of default ARCH_SPACEMIT
>> - Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-4-8=
839c5ac5db3@linux.spacemit.com/
>> ---
>>  drivers/mfd/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..c757bc365029dc794c658fc5=
b10084a0f29ac9b6 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1276,6 +1276,7 @@ config MFD_SPACEMIT_P1
>>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>>  	depends on I2C
>>  	select MFD_SIMPLE_MFD_I2C
>> +	default m if ARCH_SPACEMIT
>>  	help
>>  	  This option supports the I2C-based SpacemiT P1 PMIC, which
>>  	  contains regulators, a power switch, GPIOs, an RTC, and more.
>
> I already applied v4.
Apologies, I missed this.
I will remove the patch in the next version. Thank you for your work.

                    - Troy


