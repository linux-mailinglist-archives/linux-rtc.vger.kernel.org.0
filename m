Return-Path: <linux-rtc+bounces-6546-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFhhJ/lNC2o7FQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6546-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 19:35:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F366571AC6
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 19:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 227DA300BC7A
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 17:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A2C409DE0;
	Mon, 18 May 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ht0u1TuI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D21E376C;
	Mon, 18 May 2026 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125747; cv=none; b=d4fI7TJ8M6z/rQO92gZBvBvWjTVrj+GfpEF4FENnkgpY1E0r2BpinZ3OjPgY06rmeY/t6eOvF1eG29GpWdC4YrHpgcJRRfsKHVXR/1f2PagZSL0UBHFgbeivunCIoFLtoiQGhZjF0Q8jyDNO5QjZSxI4fWOEnzph+YuDb6Gl1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125747; c=relaxed/simple;
	bh=K/mCyKHaLchPqzDecqOtNtFUD8fdXByAkwQIJn67pqk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jmHFj1FD97BfSvMOD3Yc/NPK1ohxZdenOfAFQExsVp3TtDIwpOu1hcjqY8LUnSi7pdPzssDubxL3zX2ALXJ5WV3mJumcX/9IxgLP64Pc9+vSLTIOfcuAkIbehdtYvZy6a9+iz4yA3uXYM4u8w+fToHt6PNL4BbCTyJnnVUnwGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ht0u1TuI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779125745; x=1810661745;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=K/mCyKHaLchPqzDecqOtNtFUD8fdXByAkwQIJn67pqk=;
  b=ht0u1TuIYNOAbKVRbKn9gtROHr/92PcOTxkeONQGiBpsE/jFBPY8eBc9
   IYkNJdaMBmI1XMCaaatyQVvKSoccmc9DMlS8XEVNMnNxDibxVNys5kx1i
   G20228vOkVMb3JVPcoH2TSo3HYhOuP2vDTRa36VeNEfzZtapxDWRzThVJ
   1/lMovOHk2XvLGewJ761uXNSlgQc23ODQJF4TdXz7u5w0wXskluML79Hr
   r2ND9hMJNwaU1JAMpBy+Xv7enp3BfSRhBG/L15NH+DEb4HxIqFYlZfTzy
   I1zV2VhUE9FF8zsNheoV0jjbk6LDau/V91F/ZEFErTl8/58/fuL5Bx0iq
   g==;
X-CSE-ConnectionGUID: ZerPG+nbRKmT8l8VmPrwFg==
X-CSE-MsgGUID: 54pHuqgKSdKGmHFmEy1qsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80019959"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80019959"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 10:35:44 -0700
X-CSE-ConnectionGUID: 73AMyfo9RzGukf1oSHFgyA==
X-CSE-MsgGUID: iESTI3JST7CBpefNraLSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="238503293"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.101])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 10:35:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 18 May 2026 20:35:37 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org, 
    Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/2] rtc: Add rtc_read_next_alarm() to read next expiring
 timer
In-Reply-To: <340a79fc-864a-498c-bdfc-3c4929b5e9ae@amd.com>
Message-ID: <60cc28b4-985f-4828-57a0-e99237521a31@linux.intel.com>
References: <20260518133853.851027-1-mario.limonciello@amd.com> <20260518133853.851027-2-mario.limonciello@amd.com> <6be68c57-929b-ccf0-84a5-6f40c4c0c330@linux.intel.com> <340a79fc-864a-498c-bdfc-3c4929b5e9ae@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-822830944-1779125737=:1152"
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6546-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-rtc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Queue-Id: 7F366571AC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-822830944-1779125737=:1152
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 18 May 2026, Mario Limonciello wrote:
> On 5/18/26 11:48, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 18 May 2026, Mario Limonciello wrote:
> >=20
> > > Add a new function rtc_read_next_alarm() that reads the next expiring
> > > alarm from the RTC timerqueue. This is different from rtc_read_alarm(=
),
> > > which only reads the aie_timer.
> > >=20
> > > The wakealarm sysfs file programs the rtc->aie_timer, whereas the
> > > alarmtimer suspend routine programs its own timer into the RTC timerq=
ueue.
> > > Both timers end up in the RTC's timerqueue, and the first expiring ti=
mer
> > > is what gets armed in the hardware.
> > >=20
> > > This new function allows code to query which alarm will actually fire
> > > next, regardless of which subsystem programmed it. This is needed by
> > > platform code that needs to program secondary timers based on the
> > > actual next wakeup time.
> > >=20
> > > Link: https://lore.kernel.org/all/87ed50z0le.ffs@tglx
> > > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > > Assisted-by: Claude:claude-opus-4-6
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > >   drivers/rtc/interface.c | 42 ++++++++++++++++++++++++++++++++++++++=
+++
> > >   include/linux/rtc.h     |  2 ++
> > >   2 files changed, 44 insertions(+)
> > >=20
> > > diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> > > index 1906f4884a834..dfcb32e272eb9 100644
> > > --- a/drivers/rtc/interface.c
> > > +++ b/drivers/rtc/interface.c
> > > @@ -384,6 +384,48 @@ int __rtc_read_alarm(struct rtc_device *rtc, str=
uct
> > > rtc_wkalrm *alarm)
> > >   =09return err;
> > >   }
> > >   +/**
> > > + * rtc_read_next_alarm - read the next expiring alarm
> > > + * @rtc: RTC device
> > > + * @alarm: storage for the alarm information
> > > + *
> > > + * Read the next expiring alarm from the RTC timerqueue. This return=
s
> > > + * the alarm that will actually fire next, which may be different fr=
om
> > > + * rtc_read_alarm() if multiple timers are queued (e.g., alarmtimer
> > > + * and wakealarm sysfs both active).
> > > + *
> > > + * Returns 0 on success, -ENOENT if no alarm is pending, or other er=
ror.
> >=20
> > Missing :
>=20
> Like this you mean, right?
>=20
> Returns: 0 on success,..

Yes.

> > > + */
> > > +int rtc_read_next_alarm(struct rtc_device *rtc, struct rtc_wkalrm *a=
larm)
> > > +{
> > > +=09struct timerqueue_node *next;
> > > +=09int err;
> > > +
> > > +=09if (!rtc || !alarm)
> > > +=09=09return -EINVAL;
> > > +
> > > +=09err =3D mutex_lock_interruptible(&rtc->ops_lock);
> > > +=09if (err)
> > > +=09=09return err;
> > > +
> > > +=09next =3D timerqueue_getnext(&rtc->timerqueue);
> > > +=09if (!next) {
> > > +=09=09err =3D -ENOENT;
> > > +=09=09goto unlock;
> > > +=09}
> > > +
> > > +=09memset(alarm, 0, sizeof(struct rtc_wkalrm));
> > > +=09alarm->time =3D rtc_ktime_to_tm(next->expires);
> > > +=09alarm->enabled =3D 1;
> > > +=09alarm->pending =3D 0;
> >=20
> > Doesn't the preceeding memset() already clear everything?
>=20
> Yeah; good point.
>=20
> >=20
> > > +=09err =3D 0;
> >=20
> > Why is this needed?
>=20
> Oh I guess your point is that err was set to zero by
> mutex_lock_interruptible() already, so this is unecessary.
>
> Good catch, will drop it, thx.
>=20
> >=20
> > > +
> > > +unlock:
> > > +=09mutex_unlock(&rtc->ops_lock);
> > > +=09return err;
> > > +}
> > > +EXPORT_SYMBOL_GPL(rtc_read_next_alarm);
> > > +
> > >   int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm=
)
> > >   {
> > >   =09int err;
> > > diff --git a/include/linux/rtc.h b/include/linux/rtc.h
> > > index 95da051fb155d..c09fc22819d0c 100644
> > > --- a/include/linux/rtc.h
> > > +++ b/include/linux/rtc.h
> > > @@ -190,6 +190,8 @@ extern int rtc_set_time(struct rtc_device *rtc, s=
truct
> > > rtc_time *tm);
> > >   int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *ala=
rm);
> > >   extern int rtc_read_alarm(struct rtc_device *rtc,
> > >   =09=09=09struct rtc_wkalrm *alrm);
> > > +extern int rtc_read_next_alarm(struct rtc_device *rtc,
> > > +=09=09=09       struct rtc_wkalrm *alrm);
> > >   extern int rtc_set_alarm(struct rtc_device *rtc,
> > >   =09=09=09=09struct rtc_wkalrm *alrm);
> > >   extern int rtc_initialize_alarm(struct rtc_device *rtc,
> > >=20
> >=20
>=20
>=20

--=20
 i.

--8323328-822830944-1779125737=:1152--

