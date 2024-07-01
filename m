Return-Path: <linux-rtc+bounces-1431-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341F91DAC1
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jul 2024 10:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB9532864B3
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jul 2024 08:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CB984A39;
	Mon,  1 Jul 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LM2v/xvA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6984037;
	Mon,  1 Jul 2024 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719824250; cv=none; b=a8igWo4snuKu8ltHslOQaolrnnM0Y+9p/ZokhifmeEK0znmBr3bslKLCEvgboViC0wiLlzjGyLc8VtZVRn30YcvXF3GZZ4BazJEr/evn8hKYMs4XBVwepNDicQ1vPg/LCOQ84hiJNTUA3yH8rvqG3xvutCWAtDURZAtVOAu1UJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719824250; c=relaxed/simple;
	bh=VsuwJFzX4sE25IttFIL5itrdpII9oD4FbXeMLq78W+k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LdH4mU3wt69UWFk1B8Jwe26en0D9W3/n44HXRT1+bXiIrb6VNwqgSXigKhYEpU5gYBafooAEj4eMke7wh5MIDBQeqtesoHXSthK319QzXPlnpnSriMFuJhoWAT9b02DTvC9W0PaSrH3jatzK4xJS2lpf0mqi3SLP7riafffl9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LM2v/xvA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o4chuPjJhOwMaRcl3c10pgth9KRRgz5qWhP3IdOUpx0=; b=LM2v/xvA6pgBAd3rbdDV5h7+T9
	pOiayXJKjGhmF/hKQeycJrsuiRlWxoqMwce3KeM6788bt4p7+lJ3eHSuHgAhJynRAzZYFF/OEEyrJ
	WlrV/Z+ISnJVkGSxE2F8z76q0uUNOgTjWWmQ5HJ79+lrQDLHczbz3il0fZUeSY7WgTibMa89PXE7a
	0g8I0g5sdGxjliKlAVP+qNSsvPfIvLx/2YfaalhVrq5OgvZT+nUBNdnAPlo0TL+laSjRr/a/OskgX
	QTkD1qgD6SNnWmGbEV+lZAStShSgh20WO7cWJUu0ZAZXXKKvTTLtLWw3Mkf0ymNF7ja8k0pe6mDOT
	DADmxz6A==;
Received: from [2001:8b0:10b:5:8143:6283:9375:d9e] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCqg-0000000H9zT-34cp;
	Mon, 01 Jul 2024 08:57:22 +0000
Message-ID: <51087cd7149ce576aa166d32d051592b146ce2c4.camel@infradead.org>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 linux-kernel@vger.kernel.org,  virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-rtc@vger.kernel.org, "Ridoux,
 Julien" <ridouxj@amazon.com>,  virtio-dev@lists.linux.dev, "Luu, Ryan"
 <rluu@amazon.com>
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>, Jason Wang
 <jasowang@redhat.com>, John Stultz <jstultz@google.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon, 01 Jul 2024 09:57:21 +0100
In-Reply-To: <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
	 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
	 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
	 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
	 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
	 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
	 <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
	 <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
	 <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com>
	 <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org>
	 <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
	 <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-AjNV5g2OGp1xw371LssE"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-AjNV5g2OGp1xw371LssE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-06-28 at 22:27 +0100, David Woodhouse wrote:
> On 28 June 2024 17:38:15 BST, Peter Hilber <peter.hilber@opensynergy.com>=
 wrote:
> > On 28.06.24 14:15, David Woodhouse wrote:
> > > On Fri, 2024-06-28 at 13:33 +0200, Peter Hilber wrote:
> > > > On 27.06.24 16:52, David Woodhouse wrote:
> > > > > I already added a flags field, so this might look something like:
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Smearing flags=
. The UTC clock exposed through this structure
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is only ever t=
rue UTC, but a guest operating system may
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * choose to offe=
r a monotonic smeared clock to its users. This
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * merely offers =
a hint about what kind of smearing to perform,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * for consistenc=
y with systems in the nearby environment.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > #define VMCLOCK_FLAGS_SMEAR_UTC_SLS (1<<5) /* draft-kuhn-leapseco=
nd-00.txt */
> > > > >=20
> > > > > (UTC-SLS is probably a bad example but are there formal definitio=
ns for
> > > > > anything else?)
> > > >=20
> > > > I think it could also be more generic, like flags for linear smeari=
ng,
> > > > cosine smearing(?), and smear_start_sec and smear_end_sec fields (r=
elative
> > > > to the leap second start). That could also represent UTC-SLS, and
> > > > noon-to-noon, and it would be well-defined.
> > > >=20
> > > > This should reduce the likelihood that the guest doesn't know the s=
mearing
> > > > variant.
> > >=20
> > > I'm wary of making it too generic. That would seem to encourage a
> > > *proliferation* of false "UTC-like" clocks.
> > >=20
> > > It's bad enough that we do smearing at all, let alone that we don't
> > > have a single definition of how to do it.
> > >=20
> > > I made the smearing hint a full uint8_t instead of using bits in flag=
s,
> > > in the end. That gives us a full 255 ways of lying to users about wha=
t
> > > the time is, so we're unlikely to run out. And it's easy enough to ad=
d
> > > a new VMCLOCK_SMEARING_XXX type to the 'registry' for any new methods
> > > that get invented.
> > >=20
> > >=20
> >=20
> > My concern is that the registry update may come after a driver has alre=
ady
> > been implemented, so that it may be hard to ensure that the smearing wh=
ich
> > has been chosen is actually implemented.
>=20
> Well yes, but why in the name of all that is holy would anyone want
> to invent *new* ways to lie to users about the time? If we capture
> the existing ones as we write this, surely it's a good thing that
> there's a barrier to entry for adding more?

Ultimately though, this isn't the hill for me to die on. I'm pushing on
that topic because I want to avoid the proliferation of *ambiguity*. If
we have a precision clock, we should *know* what the time is.

So how about this proposal. I line up the fields in the proposed shared
memory structure to match your virtio-rtc proposal, using 'subtype' as
you proposed. But, instead of the 'subtype' being valid only for
VIRTIO_RTC_CLOCK_UTC, we define a new top-level type for *smeared* UTC.

So, you have:

+\begin{lstlisting}
+#define VIRTIO_RTC_CLOCK_UTC 0
+#define VIRTIO_RTC_CLOCK_TAI 1
+#define VIRTIO_RTC_CLOCK_MONO 2
+\end{lstlisting}

I propose that you add

#define VIRTIO_RTC_CLOCK_SMEARED_UTC 3

If my proposed memory structure is subsumed into the virtio-rtc
proposal we'd literally use the same names, but for the time being I'll
update mine to:

	/*
	 * What time is exposed in the time_sec/time_frac_sec fields?
	 */
	uint8_t time_type;
#define VMCLOCK_TIME_UTC		0	/* Since 1970-01-01 00:00:00z */
#define VMCLOCK_TIME_TAI		1	/* Since 1970-01-01 00:00:00z */
#define VMCLOCK_TIME_MONOTONIC		2	/* Since undefined epoch */
#define VMCLOCK_TIME_INVALID		3	/* virtio-rtc uses this for smeared UTC */


I can then use your smearing subtype values as the 'hint' field in the
shared memory structure. You currently have:

+\begin{lstlisting}
+#define VIRTIO_RTC_SUBTYPE_STRICT 0
+#define VIRTIO_RTC_SUBTYPE_SMEAR 1
+#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 2
+#define VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED 3
+\end{lstlisting}

I can certainly ensure that 'noon linear' has the same value. I don't
think you need both 'SMEAR' and 'LEAP_UNSPECIFIED' though:


+\item VIRTIO_RTC_SUBTYPE_SMEAR deviates from the UTC standard by
+	smearing time in the vicinity of the leap second, in a not
+	precisely defined manner. This avoids clock steps due to UTC
+	leap seconds.

...

+\item VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED may deviate from the UTC
+	standard w.r.t.\ leap second introduction in an unspecified
way
+	(leap seconds may, or may not, be smeared).

To the client, both of those just mean "for a day or so around a leap
second event, you can't trust this device to know what the time is".
There isn't any point in separating "does lie to you" from "might lie
to you", surely? The guest can't do anything useful with that
distinction. Let's drop SMEAR and keep only LEAP_UNSPECIFIED?

And if you *really* want to parameterise it, I think that's a bad idea
and it encourages the proliferation of different time "standards", but
I'd probably just suck it up and do whatever you do because that's not
strictly within the remit of my live-migration part.






--=-AjNV5g2OGp1xw371LssE
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzAxMDg1NzIxWjAvBgkqhkiG9w0BCQQxIgQg71q20LE+
oWGAI0eN41o4z75WSO6G50vg2RF1FQzbGywwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBiaV2XBIh7IRfvrCRplBDS0cw+K0syKnNR
O7bLA+gjFiUflk/zp/AsyOA1CKtavTWO7jBj28cCh1X6GafbzE6WeusqG6ImjRnUdkPAIUZ3OdMy
yT37K2fW5SwCehNpBfwsh+wGRijZ/U+jRIMlNQIygUwxlIKac9+iXXxSeWrLhi58KD+KRj8RzAUA
6GzA33e29SaYNICfFuMO/P7JTjgGP6kmv+t0LHo8YqW/zb8QKTXIRpIjHU6Zhu2o4AS1VgKGF3ph
HjbjLSTNqUMtGwiLa/JXuJefDEFI/QvrbdBUuIHHI7kx85cFb8HndwqgxcRclOoPjfofch6jcY6/
HngiqpjxTcw6UP9vGp2VODLRU+/cC2oSkfqit9VKaUIVvMy03o6y5dCjLQXeinxYgkbzgAnxo6IN
ZtlbzuFZKHn+kRj4mh+VOSDLvXw2odgGEav7K74cBd+ggwQxKJ3PSN21bK2tRgZiK9QycvL481gy
FyiumPQTWN3F/1s/Hp7+fdgurzD83znG0DxAsghCezW+Qk6w8jsOJ9+B4kcqTF4GP2s0DpqaKVTw
rqouqg5d9ScqO7JdJXvneqbsqQGHdHxAL5OxIm3/dadYXt/8WLsvuslHgcsKkfD3Zhu4XKb49yIO
mhcHMOYdSKiys94wOFIPYaffvmQtuGcnBR3JE8k51gAAAAAAAA==


--=-AjNV5g2OGp1xw371LssE--

